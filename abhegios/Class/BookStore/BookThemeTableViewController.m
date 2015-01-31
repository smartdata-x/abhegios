//
//  BookThemeTableViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookThemeTableViewController.h"
#import "BookTopicInfo.h"
#import "BookThemeTableViewCellStyle1.h"
#import "BookThemeTableViewCellStyle2.h"
#import "BookDetailInfoTableViewController.h"
#import "AppAPIHelper.h"
@interface BookThemeTableViewController ()
{
    BookInfo *_bookInfo;
}
@end

@implementation BookThemeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didRequest {
    [[[AppAPIHelper shared] getBookAPI] getBookTopics:5 delegate:self];
}

- (void)setData:(id)data {
    _bookInfo = data;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return MAX(0, [[_tableViewData topices] count]);
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (IS_SECTION(0)) {
        return 55;
    }
    else if (IS_SECTION(1)) {
        return 132;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = nil;
    if (IS_SECTION(0)) {
        viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookThemeTableViewCellStyle1"];
        if (_tableViewData) [viewCell setData:_tableViewData];
    }
    else if (IS_SECTION(1)) {
        viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookThemeTableViewCellStyle2"];
        if (_tableViewData) [viewCell setData:[[_tableViewData topices] objectAtIndex:indexPath.row]];
    }
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BookInfo *bookInfo = [[_tableViewData topices] objectAtIndex:indexPath.row];
    [self.navigationController pushViewControllerWithIdentifier:@"BookDetailInfoTableViewController" completion:^(UIViewController *viewController) {
        BookDetailInfoTableViewController *bookDetailInfoView = (BookDetailInfoTableViewController *)viewController;
        [bookDetailInfoView setData:bookInfo];
    } animated:YES];
}

@end
