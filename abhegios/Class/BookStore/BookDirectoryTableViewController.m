//
//  BookDirectoryTableViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDirectoryTableViewController.h"
#import "GroupInfo.h"
#import "BookSearchResultTableViewController.h"

@interface BookDirectoryTableViewController ()
{
    NSArray *boySearchType;
    NSArray *girlSearchType;
}
@end

@implementation BookDirectoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self finishLoadData];
}

- (void)finishLoadData {
    boySearchType = [[NSArray alloc] initWithObjects:@"历史军事", @"武侠仙侠", @"玄乎奇幻", nil];
    girlSearchType = [[NSArray alloc] initWithObjects:@"现代言情", @"穿越幻想", @"甜美青春", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return [boySearchType count];
    return [girlSearchType count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 49;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 22)];
    [view setBackgroundColor:kUIColorWithRGB(0xfff5f5f5)];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 12, CGRectGetWidth(self.tableView.frame)-20, 21)];
    [label setFont:[UIFont systemFontOfSize:14.0f]];
    [label setTextColor:[UIColor lightGrayColor]];
    [view addSubview:label];
    if( section == 0 ) [label setText:@"男生频道"];
    else if ( section == 1 ) [label setText:@"浪漫女生"];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDirectoryTableViewCellStyle1"];
    if (indexPath.section == 0)
        [viewCell setData:[boySearchType objectAtIndex:indexPath.row]];
    else
        [viewCell setData:[girlSearchType objectAtIndex:indexPath.row]];
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int baseTypeID = 1001;
    int stride = [boySearchType count];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewControllerWithIdentifier:@"BookSearchResultTableViewController" completion:^(UIViewController *viewController) {
        BookSearchResultTableViewController *bookSearchResultView = (BookSearchResultTableViewController *)viewController;
        bookSearchResultView.typeID = baseTypeID + indexPath.section * stride + indexPath.row;
    } animated:YES];
}

@end
