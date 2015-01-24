//
//  AppDetailsViewControllerTableViewController.m
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppDetailsViewController.h"
#import "AppDetailsInfo.h"
#import "AppInfoViewStyle3.h"
@interface AppDetailsViewController ()
{
    AppDetailsPage *_appDetailsPage;
}
@end

@implementation AppDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testData];
    
}

-(void) testData
{
     _appDetailsPage = [AppDetailsPage initWithJsonResource:@"appdetailspage_test" ofType:@"json"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 294;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppDetailsTableViewCellStyle1"];
    [cell setData:[_appDetailsPage intro]];
    return cell;
}



@end
