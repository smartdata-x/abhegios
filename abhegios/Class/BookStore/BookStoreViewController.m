//
//  BookStoreViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookStoreViewController.h"
#import "BookInfo.h"
#import "GroupInfo.h"
#import "BookDetailInfo.h"
#import "BookStoreTableViewCellStyle1.h"
#import "BookShelfViewController.h"
#import "BookReaderViewController.h"
#import "BookDetailInfoTableViewController.h"
#import "BookSearchResultTableViewController.h"
#import "BookDirectoryTableViewController.h"
#import <OEZCommSDK/OEZCommSDK.h>
@interface BookStoreViewController ()
{
    NSArray *_bookStoreHomeGroups;
}
@end

@implementation BookStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSearchBarItem];
    [self testData];
}

- (void)testData {
    _bookStoreHomeGroups = [GroupInfo initWithsConfigAndDataJsonFile:@"bookstorehome" jsonName:@"bookstorehome_test" entityClass:[BookInfo class]];
}

- (void)addSearchBarItem {
    // 右按钮
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 38, 44)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"book_shade.png"] forState:UIControlStateNormal];
    [rightButton setTitle:@"搜索" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(gotoBookSearchView:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)isSingleLine:(GroupInfo *)group {
    if ([group style] == BookStoreTableViewCellStyleOne) {
        return NO;
    }
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_bookStoreHomeGroups count] - 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupInfo *group = [_bookStoreHomeGroups objectAtIndex:section];
    if ([self isSingleLine:group]) {
        int maxrows = [[group entitys] count];
        if ([group style] == BookStoreTableViewCellStyleFour) {
            return MIN(2, maxrows);
        }
        return MIN(1, maxrows);
    }
    return [[group entitys] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    GroupInfo *group = [_bookStoreHomeGroups objectAtIndex:section];
    if ([group style] == BookStoreTableViewCellStyleTwo) {
        return 0;
    }
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupInfo *group = [_bookStoreHomeGroups objectAtIndex:indexPath.section];
    switch (group.style) {
        case BookStoreTableViewCellStyleOne:    return 132; break;
        case BookStoreTableViewCellStyleTwo:    return 80;  break;
        case BookStoreTableViewCellStyleThree:  return 153; break;
        case BookStoreTableViewCellStyleFour:
            if (indexPath.row == 0) return 112;
            else return 153;
            break;
        default: return 80; break;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    if (section != 0) {
        
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [view setBackgroundColor:kUIColorWithRGB(0xf3f3f3)];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [label setText:[[_bookStoreHomeGroups objectAtIndex:section] title]];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [view addSubview:label];
    }
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupInfo *group = [_bookStoreHomeGroups objectAtIndex:indexPath.section];
    OEZTableViewCell *viewCell = nil;
    NSString *bookCellStyle = [NSString stringWithFormat:@"BookStoreTableViewCellStyle%ld", (long)[group style]];
    if ([self isSingleLine:group]) {
        if ([group style] == 4) {
            if (indexPath.row == 0) {
                viewCell = [tableView dequeueReusableCellWithIdentifier:bookCellStyle];
                [viewCell setData:group];
            }
            else {
                viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookStoreTableViewCellStyle3"];
                [viewCell setData:group];
                BookStoreTableViewCellStyle3 *style = (BookStoreTableViewCellStyle3 *)viewCell;
                style.delegate = self;
            }
        }
        else {
            viewCell = [tableView dequeueReusableCellWithIdentifier:bookCellStyle];
            [viewCell setData:group];
        }
    }
    else {
        viewCell = [tableView dequeueReusableCellWithIdentifier:bookCellStyle];
        [viewCell setData:[[group entitys] objectAtIndex:indexPath.row]];
    }
    if ([group style] == 3) {
        BookStoreTableViewCellStyle3 *style = (BookStoreTableViewCellStyle3 *)viewCell;
        style.delegate = self;
    }
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int section = indexPath.section;
    if (section == 0) {
    }
    else if (section == 1) {
    }
    else if (section == 2 || section == 3 || section == 4) {
        [self gotoBookDetailView:nil];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)cellItemClickedAtIndex:(NSInteger)index {
    [self.navigationController pushViewControllerWithIdentifier:@"BookSearchResultTableViewController" completion:^(UIViewController *viewController) {
        BookSearchResultTableViewController *bookSearchResultView = (BookSearchResultTableViewController *)viewController;
        [bookSearchResultView setData:[_bookStoreHomeGroups objectAtIndex:1]];
    } animated:YES];
}

- (IBAction)gotoBookSearchView:(id)sender {
    [self.navigationController pushViewControllerWithIdentifier:@"BookDirectoryTableViewController" completion:^(UIViewController *viewController) {
        BookDirectoryTableViewController *bookDirectoryView = (BookDirectoryTableViewController *)viewController;
        [bookDirectoryView setData:[_bookStoreHomeGroups objectAtIndex:3]];
    } animated:YES];
}

- (IBAction)gotoBookDetailView:(id)sender {
    GroupInfo *group = [_bookStoreHomeGroups objectAtIndex:2];
    BookInfo *bookInfo = [[group entitys] objectAtIndex:0];
    BookDetailInfo *bookdetail = [[BookDetailInfo alloc] init];
    bookdetail.name = bookInfo.name;
    bookdetail.summary = bookInfo.summary;
    bookdetail.pic = bookInfo.pic;
    bookdetail.star = bookInfo.star;
    bookdetail.summary = @"《金刚经》是大乘佛教的重要经典。全称《能断金刚版若波罗蜜经》：以能断金刚的智慧到彼岸。后秦鸠摩罗什翻译《金刚经》的法本最早，文字流畅，简明扼要，流传最广，是人们常用的译本";
    bookdetail.label = [[NSArray alloc] initWithObjects:@"佛经", @"讲义", @"教理", @"阅读", nil];
    [self.navigationController pushViewControllerWithIdentifier:@"BookDetailInfoTableViewController" completion:^(UIViewController *viewController) {
        BookDetailInfoTableViewController *bookDetailInfoView = (BookDetailInfoTableViewController *)viewController;
        [bookDetailInfoView setData:bookdetail];
    } animated:YES];
}

@end
