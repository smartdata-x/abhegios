//
//  BookSearchResultTableViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookSearchResultTableViewController.h"
#import "BookDetailInfoTableViewController.h"
#import "BookSearchResultTableViewCellStyle1.h"
#import "BookInfo.h"
#import "GroupInfo.h"
#import "BookDetailInfo.h"
#import "AppAPIHelper.h"

@interface BookSearchResultTableViewController ()
{
    //NSArray *_bookSearchResultGroup;
    NSInteger resultShowType;
}
//@property (nonatomic, retain) GroupInfo *bookInfoGroup;
@end

@implementation BookSearchResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didRequest {
    [[[AppAPIHelper shared] getBookAPI] getBookSearchType:_typeID delegate:self];
    resultShowType = BookSearchResultTypeNew;
}

- (void)setData:(id)data {
    //_bookInfoGroup = data;
    //_bookSearchResultGroup = [GroupInfo initWithsConfigAndDataJsonFile:@"bookstorehome" jsonName:@"booksearchresult_test" entityClass:[BookInfo class]];
}

- (IBAction)showNewResult:(id)sender {
    resultShowType = BookSearchResultTypeNew;
    [self.tableView reloadData];
}

- (IBAction)showHotResult:(id)sender {
    resultShowType = BookSearchResultTypeHot;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return BookSearchResultSectionMAX;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == BookSearchResultSectionHeader) {
        return 1;
    }
    //return MAX(0, [[[_bookSearchResultGroup objectAtIndex:resultShowType] entitys] count]);
    return MAX(0, [[[_tableViewData objectAtIndex:resultShowType] entitys] count]);
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
        BookSearchResultTableViewCellStyle1 *viewStyle = (BookSearchResultTableViewCellStyle1 *)viewCell;
        [viewStyle.btnNew addTarget:self action:@selector(showNewResult:) forControlEvents:UIControlEventTouchUpInside];
        [viewStyle.btnHot addTarget:self action:@selector(showHotResult:) forControlEvents:UIControlEventTouchUpInside];
    }
    else {
        viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookSearchResultTableViewCellStyle2"];
        //[viewCell setData:[[[_bookSearchResultGroup objectAtIndex:resultShowType] entitys] objectAtIndex:indexPath.row]];
        [viewCell setData:[[[_tableViewData objectAtIndex:resultShowType] entitys] objectAtIndex:indexPath.row]];
    }
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //GroupInfo *group = [_bookSearchResultGroup objectAtIndex:resultShowType];
    GroupInfo *group = [_tableViewData objectAtIndex:resultShowType];
    BookInfo *bookInfo = [[group entitys] objectAtIndex:indexPath.row];
    [self.navigationController pushViewControllerWithIdentifier:@"BookDetailInfoTableViewController" completion:^(UIViewController *viewController) {
        BookDetailInfoTableViewController *bookDetailInfoView = (BookDetailInfoTableViewController *)viewController;
        [bookDetailInfoView setData:bookInfo];
    } animated:YES];
}

@end
