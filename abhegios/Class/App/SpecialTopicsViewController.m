//
//  SpecialTopicsViewControllerTableViewController.m
//  abhegios
//
//  Created by 180 on 15/2/5.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "SpecialTopicsViewController.h"
#import "AppAPIHelper.h"
@interface SpecialTopicsViewController ()

@end

@implementation SpecialTopicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void) didRequest
{
    [[[AppAPIHelper shared] getApplyAPI] getSpecialTopics:[_adInfo id] delegate:self];
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
    if( section == 0)
        return [_tableViewData count];
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppTableViewCellStyle1"];
    [cell setData:[_tableViewData objectAtIndex:[indexPath row]]];
    return cell;
}



-(void) tableView:(UITableView *)tableView rowAtIndexPath:(NSIndexPath *)indexPath didAction:(NSInteger)action
{
  
    [[[AppAPIHelper shared] getApplyAPI] getWanted:[[_tableViewData objectAtIndex:[indexPath row]] id] delegate:nil];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    {
        [self.navigationController pushAppDetailsViewController:[_tableViewData objectAtIndex:[indexPath row]]animated:YES];
    }
}


@end
