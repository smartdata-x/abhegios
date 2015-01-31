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
#import "BookReaderViewController.h"
#import "AppAPIHelper.h"

#define kMaxBookNumber 99
#define kBookNumberPerRow 3
#define kBookShelfCellHeight 153
#define kBookShelfGapperHeight 21
#define kBookItemHeight 132
#define kBookItemWidth 108

@interface BookShelfViewController ()
{
    NSArray *_bookShelfGroups;
    UIScrollView *bookShelfView;
}
@end

@implementation BookShelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    bookShelfView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:bookShelfView];
    [[[AppAPIHelper shared] getBookAPI] getBookShelfList:self];
}

- (void)finishLoadData {
    NSUInteger count = [[[_bookShelfGroups objectAtIndex:BookShelfTypeList] entitys] count];
    count = count > kMaxBookNumber ? kMaxBookNumber : count;
    float height = ceilf((float)count / kBookNumberPerRow) * kBookShelfCellHeight;
    height = height > CGRectGetHeight(bookShelfView.frame) ? height : CGRectGetHeight(bookShelfView.frame);
    CGSize size = CGSizeMake(CGRectGetWidth(self.view.frame), height);
    [bookShelfView setContentSize:size];
    
    [self addViewItem:count];
    [self addShelfGapper:ceilf((float)count / kBookNumberPerRow)];
}

- (void)addViewItem:(NSUInteger)count {
    for (int i=0; i<count; i++) {
        float x = i % 3;
        float y = i / 3;
        BookInfo *bookinfo = [[[_bookShelfGroups objectAtIndex:BookShelfTypeList] entitys] objectAtIndex:i];
        BookInfoViewStyle1 *bookitem = [BookInfoViewStyle1 loadFromNib];
        [bookitem setFrame:CGRectMake(x*kBookItemWidth, y*kBookShelfCellHeight, kBookItemWidth, kBookShelfCellHeight)];
        bookinfo.name = @""; // 此处不需要显示书名
        [bookitem setData:bookinfo];
        [bookitem setTag:i];
        bookitem.delegate = self;
        [bookShelfView addSubview:bookitem];
    }
}

- (void)addShelfGapper:(NSUInteger)count {
    for (int i=0; i<count; i++) {
        UIImageView *bgImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shelf.png"]];
        bgImgView.frame = CGRectMake(0, kBookItemHeight + kBookShelfCellHeight * i, CGRectGetWidth(bookShelfView.frame), kBookShelfGapperHeight);
        [bookShelfView addSubview:bgImgView];
    }
}

- (IBAction)gotoBookReader:(id)sender {
    [self.navigationController pushViewControllerWithIdentifier:@"BookReaderViewController" completion:^(UIViewController *viewController) {
        GroupInfo *group = [_bookShelfGroups objectAtIndex:BookShelfTypeList];
        UIButton *btnSender = (UIButton *)sender;
        BookInfo *bookInfo = [[group entitys] objectAtIndex:btnSender.tag];
        BookReaderViewController *readerView = (BookReaderViewController *)viewController;
        [readerView setData:bookInfo];
    } animated:YES];
}

- (void)didBookInfoViewStyle1Clicked:(id)bookInfoView {
    [self.navigationController pushViewControllerWithIdentifier:@"BookReaderViewController" completion:^(UIViewController *viewController) {
        BookInfoViewStyle1 *infoView = (BookInfoViewStyle1 *)bookInfoView;
        GroupInfo *group = [_bookShelfGroups objectAtIndex:BookShelfTypeList];
        BookInfo *bookInfo = [[group entitys] objectAtIndex:infoView.tag];
        BookReaderViewController *readerView = (BookReaderViewController *)viewController;
        [readerView setData:bookInfo];
    } animated:YES];
}

- (void)reqeust:(id)reqeust didComplete:(id)data {
    _bookShelfGroups = data;
    [self performSelector:@selector(finishLoadData) withObject:nil afterDelay:0.25];
}

- (void)reqeust:(id)reqeust didError:(NSError *)err {
    NSLog(@"%@",err);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
