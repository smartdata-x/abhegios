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
#import "BookThemeTableViewController.h"
#import "BookStoreTableViewCellStyle4.h"
#import <OEZCommSDK/OEZCommSDK.h>
#import "AppAPIHelper.h"
#import "ADInfo.h"

@interface BookStoreViewController ()
{
}
@end

@implementation BookStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSearchBarItem];
}

- (void)didRequest {
    [[[AppAPIHelper shared] getBookAPI] getBookStoreHome:self];
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
}

- (BOOL)isSingleLine:(GroupInfo *)group {
    if ([group style] == BookStoreTableViewCellStyleOne) {
        return NO;
    }
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger count = [_tableViewData count] - 2; // 去掉最后两个无用的列表
    count = count <= 0 ? 0 : count;
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupInfo *group = [_tableViewData objectAtIndex:section];
    if ([self isSingleLine:group]) {
        NSInteger maxrows = [[group entitys] count];
        if ([group style] == BookStoreTableViewCellStyleFour) {
            return MIN(2, maxrows);
        }
        return MIN(1, maxrows);
    }
    return [[group entitys] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    GroupInfo *group = [_tableViewData objectAtIndex:section];
    if ([group style] == BookStoreTableViewCellStyleTwo) {
        return 0;
    }
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupInfo *group = [_tableViewData objectAtIndex:indexPath.section];
    switch (group.style) {
        case BookStoreTableViewCellStyleOne:    return 132; break;
        case BookStoreTableViewCellStyleTwo:    return 100;  break;
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
        [label setText:[[_tableViewData objectAtIndex:section] title]];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [view addSubview:label];
    }
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = nil;
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    GroupInfo *group = [_tableViewData objectAtIndex:section];
    NSString *bookCellStyle = [NSString stringWithFormat:@"BookStoreTableViewCellStyle%ld", (long)[group style]];
    
    if (IS_SECTION(0)) {
        // 广告, style = 2
        viewCell = [tableView dequeueReusableCellWithIdentifier:bookCellStyle];
        [viewCell setData:group];
    }
    else if (IS_SECTION(1)) {
        // 精品推荐, style = 3, 带黄色label(cellStyle = 4)
        viewCell = [tableView dequeueReusableCellWithIdentifier:bookCellStyle];
        BookStoreTableViewCellStyle3 *styleView = (BookStoreTableViewCellStyle3 *)viewCell;
        styleView.delegate = self;
        [styleView setShowParameters:4];
        [viewCell setData:[group entitys]];
    }
    else if (IS_SECTION(2)) {
        // 热门推荐
        viewCell = [tableView dequeueReusableCellWithIdentifier:bookCellStyle];
        [viewCell setData:[[group entitys] objectAtIndex:indexPath.row]];
    }
    else if (IS_SECTION(3) || IS_SECTION(4)) {
        // 男生原创和女生原创
        if (row == 0) {
            // 大横屏
            viewCell = [tableView dequeueReusableCellWithIdentifier:bookCellStyle];
            BookStoreTableViewCellStyle4 *viewStyle = (BookStoreTableViewCellStyle4 *)viewCell;
            [viewStyle.favRate setColorStyle:FavRateColorStyleWhite];
            [viewCell setData:group];
        }
        else {
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookStoreTableViewCellStyle3"];
            BookStoreTableViewCellStyle3 *styleView = (BookStoreTableViewCellStyle3 *)viewCell;
            [styleView setShowParameters:1];
            styleView.delegate = self;
            // 只从第二个开始显示
            NSArray *bookArray = [[NSArray alloc] initWithObjects:[[group entitys] objectAtIndex:1], [[group entitys] objectAtIndex:2], [[group entitys] objectAtIndex:3], nil];
            [viewCell setData:bookArray];
        }
    }
    return viewCell;
}

- (void)tableView:(UITableView *)tableView rowAtIndexPath:(NSIndexPath *)indexPath didSelectColumnAtIndex:(NSInteger)column {
    GroupInfo *group = [_tableViewData objectAtIndex:indexPath.section];
    NSInteger row = [indexPath row] + column;
    if ([[group key] hasPrefix:@"advert"]) {
        ADInfo *adInfo = [[group entitys] objectAtIndex:row];
        BookInfo *bookInfo = [[BookInfo alloc] init];
        [bookInfo setName:@""];
        [bookInfo setId:[adInfo id]];
        [self.navigationController pushViewControllerWithIdentifier:@"BookDetailInfoTableViewController" completion:^(UIViewController *viewController) {
            BookDetailInfoTableViewController *bookDetailInfoView = (BookDetailInfoTableViewController *)viewController;
            [bookDetailInfoView setData:bookInfo];
        } animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    if (section == 0) {
    }
    else if (section == 1) {
    }
    else if (section == 2 || section == 3 || section == 4) {
        [self gotoBookDetailView:indexPath];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)cellItemClickedAtIndex:(NSInteger)index {
    GroupInfo *group = [_tableViewData objectAtIndex:1];
    BookInfo *bookInfo = [[group entitys] objectAtIndex:index];
    [self.navigationController pushViewControllerWithIdentifier:@"BookThemeTableViewController" completion:^(UIViewController *viewController) {
        BookThemeTableViewController *infoView = (BookThemeTableViewController *)viewController;
        [infoView setData:bookInfo];
    } animated:YES];
}

- (void)cellItemClickedByView:(id)clickedView {
    NSString *clickedName = ((BookInfoViewStyle1 *)clickedView).name.text;
    BookInfo *bookinfo = nil;
    
    // 根据书名匹配section3和section4点击的书
    GroupInfo *group = [_tableViewData objectAtIndex:3];
    for (int i=0; i<[[group entitys] count]; i++) {
        BookInfo *tmpBookInfo = [[group entitys] objectAtIndex:i];
        if ([clickedName isEqualToString:tmpBookInfo.name]) {
            bookinfo = tmpBookInfo;
            break;
        }
    }
    if (bookinfo == nil) {
        group = [_tableViewData objectAtIndex:4];
        for (int i=0; i<[[group entitys] count]; i++) {
            BookInfo *tmpBookInfo = [[group entitys] objectAtIndex:i];
            if ([clickedName isEqualToString:tmpBookInfo.name]) {
                bookinfo = tmpBookInfo;
                break;
            }
        }
    }
    if (bookinfo) {
        //跳转到书籍详情
        [self.navigationController pushViewControllerWithIdentifier:@"BookDetailInfoTableViewController" completion:^(UIViewController *viewController) {
            BookDetailInfoTableViewController *bookDetailInfoView = (BookDetailInfoTableViewController *)viewController;
            [bookDetailInfoView setData:bookinfo];
        } animated:YES];
    }
}

- (IBAction)gotoBookSearchView:(id)sender {
    [self.navigationController pushViewControllerWithIdentifier:@"BookDirectoryTableViewController" completion:^(UIViewController *viewController) {
    } animated:YES];
}

- (IBAction)gotoBookDetailView:(id)sender {
    NSIndexPath *indexPath = (NSIndexPath *)sender;
    GroupInfo *group = [_tableViewData objectAtIndex:indexPath.section];
    BookInfo *bookInfo = [[group entitys] objectAtIndex:indexPath.row];
    [self.navigationController pushViewControllerWithIdentifier:@"BookDetailInfoTableViewController" completion:^(UIViewController *viewController) {
        BookDetailInfoTableViewController *bookDetailInfoView = (BookDetailInfoTableViewController *)viewController;
        [bookDetailInfoView setData:bookInfo];
    } animated:YES];
}

@end
