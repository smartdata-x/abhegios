//
//  BookShelfViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookShelfViewController.h"
#import "BookInfo.h"
#import "GroupInfo.h"
#import "BookInfoViewStyle1.h"

#define kMaxBookNumber 99
#define kBookNumberPerRow 3
#define kBookShelfCellHeight 153
#define kBookShelfGapperHeight 21
#define kBookItemHeight 132
#define kBookItemWidth 108

@interface BookShelfViewController ()
@property UIScrollView *bookShelfView;
@property GroupInfo *bookInfoGroup;
@end

@implementation BookShelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _bookShelfView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_bookShelfView];
}

- (void)setData:(id)data {
    _bookInfoGroup = data;
    NSUInteger count = [[_bookInfoGroup entitys] count];
    count = count > kMaxBookNumber ? kMaxBookNumber : count;
    float height = ceilf((float)count / kBookNumberPerRow) * kBookShelfCellHeight;
    height = height > CGRectGetHeight(_bookShelfView.frame) ? height : CGRectGetHeight(_bookShelfView.frame);
    CGSize size = CGSizeMake(CGRectGetWidth(self.view.frame), height);
    [_bookShelfView setContentSize:size];
    
    [self addViewItem:count];
    [self addShelfGapper:ceilf((float)count / kBookNumberPerRow)];
}

- (void)addViewItem:(NSUInteger)count {
    for (int i=0; i<count; i++) {
        float x = i % 3;
        float y = i / 3;
        BookInfo *bookinfo = [[_bookInfoGroup entitys] objectAtIndex:i];
        BookInfoViewStyle1 *bookitem = [BookInfoViewStyle1 loadFromNib];
        [bookitem setFrame:CGRectMake(x*kBookItemWidth, y*kBookShelfCellHeight, kBookItemWidth, kBookShelfCellHeight)];
        [bookitem setDataWithFormat:bookinfo Format:BookInfoViewStyle1Format2];
        [_bookShelfView addSubview:bookitem];
    }
}

- (void)addShelfGapper:(NSUInteger)count {
    for (int i=0; i<count; i++) {
        UIImageView *bgImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shelf.png"]];
        bgImgView.frame = CGRectMake(0, kBookItemHeight + kBookShelfCellHeight * i, CGRectGetWidth(_bookShelfView.frame), kBookShelfGapperHeight);
        [_bookShelfView addSubview:bgImgView];
    }
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
