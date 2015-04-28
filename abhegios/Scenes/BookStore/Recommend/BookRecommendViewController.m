//
//  BookRecommendViewController.m
//  abhegios
//
//  Created by yaobanglin on 15/4/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookRecommendViewController.h"
#import "AppAPIHelper.h"
#import "BookInfo.h"
@interface BookRecommendViewController ()

@end

@implementation BookRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) didRequest
{
    [[[AppAPIHelper shared] getBookAPI] getPersonal:self];
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
    OEZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookTableViewCellStyle1"];
    [cell setData:[_tableViewData objectAtIndex:[indexPath row]]];
    return cell;
}



-(void) tableView:(UITableView *)tableView rowAtIndexPath:(NSIndexPath *)indexPath didAction:(NSInteger)action
{
    
   
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    {
        [self.navigationController pushBookDetailsViewController:[_tableViewData objectAtIndex:[indexPath row]]animated:YES];
    }
}



@end
