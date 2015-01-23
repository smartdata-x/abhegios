//
//  BookReaderViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookReaderViewController.h"

@interface BookChapterInfo()
@property NSUInteger id;
@property NSString *name;
@property NSString *summary;
@property NSString *url;
@end

@interface BookReaderViewController ()
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
    _chapterGroup = [[NSMutableArray alloc] init];
    
#if 0
    _textView.font = textfont;
    _textView.textColor = MIG_COLOR_111111;
    _textView.editable = NO;
    [_textView setUserInteractionEnabled:NO];
    [_textView setContentOffset:CGPointMake(0, 0)];
    [_textView setBackgroundColor:[UIColor clearColor]];
#endif
}

- (void)initView {
    [_readerView setFont:[UIFont systemFontOfSize:14.0f]];
    [_readerView setTextColor:[UIColor whiteColor]];
    [_readerView setEditable:NO];
    [_readerView setUserInteractionEnabled:NO];
    [_readerView setContentOffset:CGPointMake(0, 0)];
}

- (void)viewWillAppear:(BOOL)animated {
    [self jumpToLastPosition];
}

- (void)setData:(id)data {
    
}

- (BOOL)isCurrentChapterExist {
    return NO;
}

- (BOOL)isNeedDownload {
    return YES;
}

- (BOOL)isNeedContinueLastPosition {
    return YES;
}

- (void)downloadWholeBook {
    
}

- (void)jumpToLastPosition {
    if ([self isNeedContinueLastPosition]) {
        // TODO:set chapter;
    }
}

- (void)loadNewChapter {
    if (![self isCurrentChapterExist]) {
        if ([self isNeedDownload]) {
            // TODO:Download
            return;
        }
    }
    
    _bookContent = @"1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n57\n58\n59\n60\n61\n62\n63\n64\n65\n66\n67\n68\n69\n70\n";
    float fontSize = 14.0f;
    float lineHeight = 10.0f;
    float hPadding = 16.0f;
    float maxContentHeight = CGRectGetHeight(_readerView.frame) - hPadding;
    int lines = maxContentHeight / (fontSize + lineHeight);
    _pageHeight = lines * (fontSize + lineHeight);
    maxContentHeight = _pageHeight + hPadding;
    
    NSMutableParagraphStyle *parastyle = [[NSMutableParagraphStyle alloc] init];
    parastyle.lineHeightMultiple = lineHeight;
    parastyle.maximumLineHeight = lineHeight;
    parastyle.minimumLineHeight = lineHeight;
    parastyle.firstLineHeadIndent = lineHeight;
    parastyle.alignment = NSTextAlignmentJustified;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:parastyle, NSForegroundColorAttributeName:[UIColor whiteColor]};
    NSAttributedString *attribText = [[NSAttributedString alloc] initWithString:_bookContent attributes:attributes];
    _readerView.attributedText = attribText;
    
    float contentHeight = 100000;// TODO:
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
        return;
    }
    _currentChapter++;
    _currentPage = -1;
    [self nextPage];
}

- (void)prevChapter {
    if (_currentChapter <= 0) {
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
    
    // Page Animation
}

- (void)prevPage {
    if (_currentPage <= 0) {
        return;
    }
    _currentPage--;
    [self setContentOffsetAnimated:YES];
    
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
