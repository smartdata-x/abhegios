//
//  AppDetailsViewControllerTableViewController.m
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppDetailsViewController.h"
#import "AppDetailsInfo.h"
#import "AppAPIHelper.h"
typedef NS_ENUM(NSInteger, AppDetailsTableViewCellStyle) {
    AppDetailsTableViewCellStyleNone = 0,
    AppDetailsTableViewCellStyleOne,
    AppDetailsTableViewCellStyleTwo ,
    AppDetailsTableViewCellStyleThree ,
    AppDetailsTableViewCellStyleFour
};

@interface AppDetailsViewController ()
{
    
}
@end

@implementation AppDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

-(void)  didRequest
{
    [[[AppAPIHelper shared] getApplyAPI] getAppDetails:_appID delegate:self];
}


-(void) reqeust:(id)reqeust didComplete:(id)data
{
    [super reqeust:reqeust didComplete:data];
    [self setTitle:[[data intro] name]];
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
    return _tableViewData != nil ? AppDetailsTableViewCellStyleFour : 0;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( [indexPath section] == 0 )
    {
        switch ([indexPath row] + 1)
        {
            case AppDetailsTableViewCellStyleOne:
                return 294;
            case AppDetailsTableViewCellStyleTwo:
            {
                CGFloat height = [[[_tableViewData intro] summary] sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(kMainScreenWidth-30, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping].height;
                height += 80;
                return height;
            }
            case AppDetailsTableViewCellStyleThree:
                return 110;
            case AppDetailsTableViewCellStyleFour:
                return 200;
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ( [indexPath section] == 0 && [indexPath row] < AppDetailsTableViewCellStyleFour)
    {
        OEZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat: @"AppDetailsTableViewCellStyle%@",@([indexPath row]+1)]];
        if ( [indexPath row] + 1 == AppDetailsTableViewCellStyleThree )
        {
            [cell setData:[_tableViewData like]];
        }
        else
            [cell setData:[_tableViewData intro]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AppDetailsTableViewCellStyleNone"];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushAppDetailsViewController:[[_tableViewData like] objectAtIndex:[indexPath row] ] animated:YES ];
}

@end
