//
//  GameHomeViewController.m
//  abhegios
//
//  Created by 180 on 15/1/26.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "GameHomeViewController.h"
#import "GameHomeInfo.h"
#import "AppAPIHelper.h"
#import "GroupInfo.h"
#define kMaxRowNum 4
@interface GameHomeViewController ()
{
    
}
@end

@implementation GameHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}



-(void) didRequest
{
    [[[AppAPIHelper shared] getApplyAPI] getGameStoreHome:self];
}

-(void) test
{
    _tableViewData = [GameHomeInfo initWithJsonResource:@"gamehomeinfo_test" ofType:@"json"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if( section == 0 )
        return 0;
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == 0) {
        if( [indexPath row] == 1 )
            return 152;
        return 80;
    }
    return 90;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [[_tableViewData groups] count] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ( section == 0 )
    {
        if( [_tableViewData emblem] != nil )
        {
            if ( [[[_tableViewData emblem] pic] count] > 0) {
                return 2;
            }
            return 1;
        }
        return 0;
    }
    GroupInfo* groupInfo = [[_tableViewData groups] objectAtIndex:section-1];
    NSInteger count = [[groupInfo entitys] count];
    count = count/kMaxRowNum + (count % kMaxRowNum != 0 ? 1 : 0);
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OEZTableViewCell *cell = nil;
    
    if ([indexPath section] == 0) {
        if( [indexPath row] == 0 )
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"GameHomeTableViewCell1"];
            [cell setData:[_tableViewData emblem]];
        }
        else
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"GameHomeTableViewCell2"];
            [cell setData:[[_tableViewData emblem] pic]];
        }
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"GameHomeTableViewCell3"];
        GroupInfo* groupInfo = [[_tableViewData groups] objectAtIndex:[indexPath section]-1];
        NSInteger start = [indexPath row] * kMaxRowNum;
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (NSInteger i = start; i < [[groupInfo entitys] count] && i < start + kMaxRowNum ; ++i)
        {
            [array addObject:[[groupInfo entitys] objectAtIndex:i]];
        }
        [cell setData:array];
    }
    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    if( section != 0 )
    {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 22)];
        [view setBackgroundColor:kUIColorWithRGB(0xf3f3f3)];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, kMainScreenWidth-20, 21)];
        [label setText:[[[_tableViewData groups] objectAtIndex:section-1] title]];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [view addSubview:label];
    }
    return view;
}
@end
