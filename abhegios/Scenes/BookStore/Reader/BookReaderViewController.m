//
//  BookReaderViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookReaderViewController.h"
#import "GroupInfo.h"
#import "BookChapterInfo.h"
#import "BookFileManager.h"
#import "AppAPIHelper.h"

@interface BookReaderViewController ()
{
    BookInfo *_bookInfo;
    NSArray *_bookChapterGroup;
    BOOL _continueReading;
    BOOL _fullScreen;
    BOOL viewDidAppear;
    CGFloat _fontSize;
}
@property NSMutableArray *chapterGroup;
@property NSString *bookContent;
@property NSInteger chapterCount;
@property NSInteger pageCount;
@property NSInteger currentChapter;
@property NSInteger currentPage;
@property NSInteger allPageCount;
@property float pageHeight;
@property BookFileManager *bookFileMgr;
@property BookDownloader *bookDownloader;
@end

@implementation BookReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    _fullScreen = YES;
    
    // 左翻页
    UISwipeGestureRecognizer *nextGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(doNext:)];
    nextGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    nextGesture.delegate = self;
    [self.view addGestureRecognizer:nextGesture];
    
    // 右翻页
    UISwipeGestureRecognizer *prevGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(doPrev:)];
    prevGesture.direction = UISwipeGestureRecognizerDirectionRight;
    prevGesture.delegate = self;
    [self.view addGestureRecognizer:prevGesture];
    
    // 点击
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTap:)];
    tapGesture.delegate = self;
    [self.view addGestureRecognizer:tapGesture];
    
    // 初始化到第一章
    _currentChapter = -1;
}

- (void)setData:(id)data {
    _bookInfo = data;
    [[[AppAPIHelper shared] getBookAPI] getBookChapterList:_bookInfo.id BookToken:_bookInfo.booktoken delegate:self];
}

- (void)setDataWithUrl:(id)data URL:(NSString *)url {
    _bookInfo = data;
    
    //带url，自己构建一个freeread结构
    BookChapterInfo *chapterinfo = [[BookChapterInfo alloc] init];
    chapterinfo.url = url;
    chapterinfo.chaptername = @"";
    _bookChapterGroup = [[NSArray alloc] initWithObjects:chapterinfo, nil];
    _chapterCount = 1;
    _continueReading = NO;
}

- (void)finishLoadData {
    _chapterCount = [[[_bookChapterGroup objectAtIndex:BookReaderTypeChapterList] entitys] count];
    if (viewDidAppear) {
        //[self viewDidAppear:YES];
    }
}

- (void)reqeust:(id)reqeust didComplete:(id)data {
    _bookChapterGroup = data;
    [self performSelector:@selector(finishLoadData) withObject:nil afterDelay:0.25];
}

- (void)reqeust:(id)reqeust didError:(NSError *)err {
    NSLog(@"%@",err);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    if ([self isNeedContinueLastPosition]) {
        [self jumpToLastPosition];
        [self nextPage];
    }
    else {
        [self nextChapter];
    }
    
    [self updateFullScreen];
    viewDidAppear = YES;
}

- (void)updateFullScreen {
    [[UIApplication sharedApplication] setStatusBarHidden:_fullScreen withAnimation:YES];
    [self.navigationController.navigationBar setHidden:_fullScreen];
    
    float navHeight = 65;
    CGRect frame = [self.view frame];
    if (_fullScreen) {
        frame.origin.y -= navHeight;
        frame.size.height += navHeight;
    }
    else {
        frame.origin.y += navHeight;
        frame.size.height -= navHeight;
    }
    [self.view setFrame:frame];
}

- (void)viewDidDisappear:(BOOL)animated {
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)initView {
    _fontSize = 17.0f;
    _bookFileMgr = [[BookFileManager alloc] init];
    _bookDownloader = [[BookDownloader alloc] init];
    _bookDownloader.delegate = self;
    [_readerView setTextColor:[UIColor blackColor]];
    [_readerView setEditable:NO];
    [_readerView setUserInteractionEnabled:NO];
    [_readerView setContentOffset:CGPointMake(0, 0)];
}

- (void)curlUp:(UIView *)view {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:view cache:YES];
    [UIView commitAnimations];
}

- (void)curlDown:(UIView *)view {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:view cache:YES];
    [UIView commitAnimations];
}

- (void)curlLeft:(UIView *)view {
    CATransition *tr = [CATransition animation];
    tr.duration = 0.6;
    tr.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    tr.type = @"pageUnCurl";
    tr.subtype = @"fromLeft";
    tr.fillMode = kCAFillModeForwards;
    [tr setFillMode:@"extended"];
    [tr setRemovedOnCompletion:NO];
    
    tr.delegate = self;
    [view.layer addAnimation:tr forKey:@"pageCurlAnimation"];
}

- (void)curlRight:(UIView *)view {
    CATransition *tr = [CATransition animation];
    tr.duration = 0.6;
    tr.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    tr.type = @"pageUnCurl";
    tr.subtype = @"fromRight";
    tr.fillMode = kCAFillModeForwards;
    [tr setFillMode:@"extended"];
    [tr setRemovedOnCompletion:NO];
    
    tr.delegate = self;
    [view.layer addAnimation:tr forKey:@"pageCurlAnimation"];
}

- (BOOL)isCurrentChapterExist:(NSString *)fullName {
    return [_bookFileMgr isBookExist:fullName];
}

- (BOOL)isNeedDownload {
    return YES;
}

- (BOOL)isNeedContinueLastPosition {
    return _continueReading;
}

- (void)downloadWholeBook {
    
}

- (void)doTap:(UIGestureRecognizer *)gesture {
    _fullScreen = !_fullScreen;
    [self updateFullScreen];
}

- (void)doNext:(UIGestureRecognizer *)gesture {
    [self nextPage];
}

- (void)doPrev:(UIGestureRecognizer *)gesture {
    [self prevPage];
}

- (void)jumpToLastPosition {
}

- (float)heightForAttributedString:(NSAttributedString *)srcstr Font:(UIFont *)font Frame:(CGRect)frame {
    CGSize size = CGSizeMake(CGRectGetWidth(frame), CGRectGetHeight(frame));
    CGRect labelSize = [srcstr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    
    return labelSize.size.height;
}

- (BOOL)loadNewChapter {
    GroupInfo *group = [_bookChapterGroup objectAtIndex:BookReaderTypeChapterList];
    BookChapterInfo *chapterInfo = [[group entitys] objectAtIndex:_currentChapter];
    NSString *chapterName = [NSString stringWithFormat:@"%@_%ld.txt", _bookInfo.name, (long)_currentChapter];
    NSString *fullName = [_bookFileMgr getBookFullPath:chapterName];
    
    if (![self isCurrentChapterExist:fullName]) {
        if ([self isNeedDownload]) {
            [_bookDownloader downloadBookFromURL:chapterInfo.url FileName:chapterName];
        }
        return NO;
    }
    
    _bookContent = [_bookFileMgr getFileContent:fullName];
    [self configTextView];
    return YES;
}

- (void)bookDownloadFinished:(BOOL)success FileName:(NSString *)filename{
    if (success) {
        _bookContent = [_bookFileMgr getFileContent:filename];
        [self configTextView];
        [self nextPage];
    }
}

- (int)getLineNumberAccordingToDevices {
    int lineNumber = 12;
    float screenHeight = kMainScreenHeight;
    if (screenHeight >= 480) lineNumber = 12;
    if (screenHeight >= 568) lineNumber = 13;
    if (screenHeight >= 667) lineNumber = 14;
    return lineNumber;
}

- (void)configTextView {
    int lineNumber = [self getLineNumberAccordingToDevices];
    float readerFrameHeight = CGRectGetHeight(_readerView.frame);
    float oneRowHeight = readerFrameHeight / lineNumber;
    float lineSpace = oneRowHeight - _fontSize;
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.alignment = NSTextAlignmentJustified;
    paraStyle.paragraphSpacing = 0.0f;
    paraStyle.lineSpacing = lineSpace;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:_fontSize], NSParagraphStyleAttributeName:paraStyle, NSForegroundColorAttributeName:kUIColorWithRGB(0x111111)};
    NSAttributedString *attribText = [[NSAttributedString alloc] initWithString:_bookContent attributes:attributes];
    _readerView.attributedText = attribText;
    
    CGRect constrainsFrame = CGRectMake(0, 0, CGRectGetWidth(_readerView.frame), readerFrameHeight);
    NSAttributedString *heightTestText = [[NSAttributedString alloc] initWithString:@"刘" attributes:attributes];
    oneRowHeight = [self heightForAttributedString:heightTestText Font:_readerView.font Frame:constrainsFrame];
    _pageHeight = oneRowHeight * (lineNumber - 1);
    
    constrainsFrame = CGRectMake(0, 0, CGRectGetWidth(_readerView.frame), MAXFLOAT);
    float contentHeight = [self heightForAttributedString:attribText Font:_readerView.font Frame:constrainsFrame];
    contentHeight = ceilf(contentHeight);
    _pageCount = ceilf(contentHeight / _pageHeight);
    
    // 配置其他标签显示
    [_nameView setText:[NSString stringWithFormat:@"《%@》", _bookInfo.name]];
    [_chapterView setText:[[[[_bookChapterGroup objectAtIndex:BookReaderTypeChapterList] entitys] objectAtIndex:_currentChapter] chaptername]];
}

- (void)setContentOffsetAnimated:(BOOL)animate {
    float pageHeightOffset = _currentPage * _pageHeight;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1f];
    [_readerView setContentOffset:CGPointMake(0, pageHeightOffset)];
    [UIView commitAnimations];
}

- (void)nextChapter {
    if (_currentChapter >= _chapterCount - 1) {
        return;
    }
    _currentChapter++;
    _currentPage = -1;
    
    if (![self loadNewChapter]) {
        return;
    }
    [self nextPage];
}

- (void)prevChapter {
    if (_currentChapter <= 0) {
        return;
    }
    _currentChapter--;
    _currentPage = _pageCount;
    
    if (![self loadNewChapter]) {
        return;
    }
    [self prevPage];
}

- (void)nextPage {
    if (_currentPage >= _pageCount - 1) {
        [self nextChapter];
        return;
    }
    if (_bookContent == nil) {
        return;
    }
    _currentPage++;
    [self setContentOffsetAnimated:YES];
    [self curlLeft:self.view];
}

- (void)prevPage {
    if (_currentPage <= 0) {
        [self prevChapter];
        return;
    }
    if (_bookContent == nil) {
        return;
    }
    _currentPage--;
    [self setContentOffsetAnimated:YES];
    [self curlRight:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end