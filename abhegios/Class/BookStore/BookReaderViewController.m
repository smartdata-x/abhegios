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
#import "BookDownloader.h"
#import "BookFileManager.h"

@interface BookReaderViewController ()
{
    NSArray *_bookChapterGroup;
}
@property NSMutableArray *chapterGroup;
@property NSString *bookContent;
@property NSInteger chapterCount;
@property NSInteger pageCount;
@property NSInteger currentChapter;
@property NSInteger currentPage;
@property NSInteger allPageCount;
@property float pageHeight;
@end

@implementation BookReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testData];
    [self initView];
    
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
}

- (void)testData {
    _bookChapterGroup = [GroupInfo initWithsConfigAndDataJsonFile:@"bookstorehome" jsonName:@"bookchapter_test" entityClass:[BookChapterInfo class]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)initView {
    [_readerView setFont:[UIFont systemFontOfSize:14.0f]];
    [_readerView setTextColor:[UIColor blackColor]];
    [_readerView setEditable:NO];
    [_readerView setUserInteractionEnabled:NO];
    [_readerView setContentOffset:CGPointMake(0, 0)];
    
    //
    _chapterCount = 10;
    _currentChapter = 0;
    [self loadNewChapter];
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

- (void)viewWillAppear:(BOOL)animated {
    [self jumpToLastPosition];
}

- (void)setData:(id)data {
    
}

- (BOOL)isCurrentChapterExist {
    return YES;
}

- (BOOL)isNeedDownload {
    return YES;
}

- (BOOL)isNeedContinueLastPosition {
    return YES;
}

- (void)downloadWholeBook {
    
}

- (void)doTap:(UIGestureRecognizer *)gesture {
    
}

- (void)doNext:(UIGestureRecognizer *)gesture {
    [self nextPage];
}

- (void)doPrev:(UIGestureRecognizer *)gesture {
    [self prevPage];
}

- (void)jumpToLastPosition {
    if ([self isNeedContinueLastPosition]) {
        // TODO:set chapter;
    }
}

- (float)heightForAttributedString:(NSAttributedString *)srcstr Font:(UIFont *)font Frame:(CGRect)frame {
    CGSize size = CGSizeMake(frame.size.width, MAXFLOAT);
    CGRect labelSize = [srcstr boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return labelSize.size.height;
}

- (void)loadNewChapter {
    if (![self isCurrentChapterExist]) {
        if ([self isNeedDownload]) {
            // TODO:Download
            return;
        }
    }
    
    _bookContent = @"1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n57\n58\n59\n60\n61\n62\n63\n64\n65\n66\n67\n68\n69\n70\n";
    float fontSize = 16.0f;
    float lineHeight = fontSize * 2;
    float hPadding = 16.0f;
    float readerFrameHeight = CGRectGetHeight(_readerView.frame);
    float maxContentHeight = readerFrameHeight - hPadding;
    int lines = maxContentHeight / (fontSize + lineHeight);
    _pageHeight = lines * (fontSize + lineHeight);
    readerFrameHeight = _pageHeight + hPadding;
    
    NSMutableParagraphStyle *parastyle = [[NSMutableParagraphStyle alloc] init];
    parastyle.lineHeightMultiple = 20;
    parastyle.maximumLineHeight = lineHeight;
    parastyle.minimumLineHeight = lineHeight;
    parastyle.firstLineHeadIndent = 20;
    parastyle.alignment = NSTextAlignmentJustified;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:parastyle, NSForegroundColorAttributeName:kUIColorWithRGB(0x111111)};
    NSAttributedString *attribText = [[NSAttributedString alloc] initWithString:_bookContent attributes:attributes];
    _readerView.attributedText = attribText;
    
    CGRect newFrame = CGRectMake(0, 0, CGRectGetWidth(_readerView.frame), _pageHeight);
    float contentHeight = [self heightForAttributedString:attribText Font:_readerView.font Frame:newFrame];
    newFrame = [_readerView frame];
    newFrame.size.height = readerFrameHeight;
    [_readerView setFrame:newFrame];
    _pageCount = ceilf(contentHeight / _pageHeight);
}

- (void)setContentOffsetAnimated:(BOOL)animate {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1f];
    [_readerView setContentOffset:CGPointMake(0, _currentPage * _pageHeight)];
    [UIView commitAnimations];
}

- (void)nextChapter {
    if (_currentChapter >= _chapterCount - 1) {
        [self nextChapter];
        return;
    }
    _currentChapter++;
    _currentPage = -1;
    [self nextPage];
}

- (void)prevChapter {
    if (_currentChapter <= 0) {
        [self prevChapter];
        return;
    }
    _currentChapter--;
    _currentPage = _pageCount;
    [self prevPage];
}

- (void)nextPage {
    if (_currentPage >= _pageCount - 1) {
        return;
    }
    _currentPage++;
    [self setContentOffsetAnimated:YES];
    [self curlLeft:self.view];
}

- (void)prevPage {
    if (_currentPage <= 0) {
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
