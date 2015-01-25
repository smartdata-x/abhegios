//
//  BookSearchResultTableViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookSearchResultTableViewController.h"
#import "BookDetailInfoTableViewController.h"
#import "BookInfo.h"
#import "GroupInfo.h"
#import "BookDetailInfo.h"

@interface BookSearchResultTableViewController ()
@property (nonatomic, retain) GroupInfo *bookInfoGroup;
@end

@implementation BookSearchResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setData:(id)data {
    _bookInfoGroup = data;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return BookSearchResultSectionMAX;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == BookSearchResultSectionHeader) {
        return 1;
    }
    return MAX(0, [[_bookInfoGroup entitys] count]);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == BookSearchResultSectionHeader) {
        return 70;
    }
    return 132;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = nil;
    if (indexPath.section == BookSearchResultSectionHeader) {
        viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookSearchResultTableViewCellStyle1"];
        [viewCell setData:nil];
    }
    else {
        viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookSearchResultTableViewCellStyle2"];
        [viewCell setData:[[_bookInfoGroup entitys] objectAtIndex:indexPath.row]];
    }
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BookInfo *bookInfo = [[_bookInfoGroup entitys] objectAtIndex:0];
    BookDetailInfo *bookdetail = [[BookDetailInfo alloc] init];
    bookdetail.name = bookInfo.name;
    bookdetail.summary = bookInfo.summary;
    bookdetail.pic = bookInfo.pic;
    bookdetail.star = bookInfo.star;
    bookdetail.introduction = @"《金刚经》是大乘佛教的重要经典。全称《能断金刚版若波罗蜜经》：以能断金刚的智慧到彼岸。后秦鸠摩罗什翻译《金刚经》的法本最早，文字流畅，简明扼要，流传最广，是人们常用的译本";
    bookdetail.labels = [[NSArray alloc] initWithObjects:@"佛经", @"讲义", @"教理", @"阅读", nil];
    [self.navigationController pushViewControllerWithIdentifier:@"BookDetailInfoTableViewController" completion:^(UIViewController *viewController) {
        BookDetailInfoTableViewController *bookDetailInfoView = (BookDetailInfoTableViewController *)viewController;
        [bookDetailInfoView setData:bookdetail];
    } animated:YES];
}

@end
