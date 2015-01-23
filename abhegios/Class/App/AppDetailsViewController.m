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

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


@end
