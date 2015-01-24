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

typedef NS_ENUM(NSInteger, AppDetailsTableViewCellStyle) {
    AppDetailsTableViewCellStyleNone = 0,
    AppDetailsTableViewCellStyleOne,
    AppDetailsTableViewCellStyleTwo ,
    AppDetailsTableViewCellStyleThree ,
    AppDetailsTableViewCellStyleFour
};

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
    return 4;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath row] + 1)
    {
        case AppDetailsTableViewCellStyleOne:
            return 294;
        case AppDetailsTableViewCellStyleTwo:
            return 100;
        case AppDetailsTableViewCellStyleThree:
            return 90;
        case AppDetailsTableViewCellStyleFour:
            return 173;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ( [indexPath section] == 0 && [indexPath row] < AppDetailsTableViewCellStyleFour)
    {
        OEZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat: @"AppDetailsTableViewCellStyle%@",@([indexPath row]+1)]];
        if ( [indexPath row] + 1 == AppDetailsTableViewCellStyleThree )
        {
            [cell setData:[_appDetailsPage like]];
        }
        else
            [cell setData:[_appDetailsPage intro]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellStyleDefault"];
}



@end
