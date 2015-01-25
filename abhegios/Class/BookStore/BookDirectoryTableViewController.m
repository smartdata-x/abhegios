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
@property (nonatomic, retain) GroupInfo *bookInfoGroup;
@end

@implementation BookDirectoryTableViewController

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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_bookInfoGroup entitys] count];
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
    else if ( section == 1 ) [label setText:@"女生频道"];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDirectoryTableViewCellStyle1"];
    [viewCell setData:[[_bookInfoGroup entitys] objectAtIndex:indexPath.row]];
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewControllerWithIdentifier:@"BookSearchResultTableViewController" completion:^(UIViewController *viewController) {
        BookSearchResultTableViewController *bookSearchResultView = (BookSearchResultTableViewController *)viewController;
        [bookSearchResultView setData:_bookInfoGroup];
    } animated:YES];
}

@end
