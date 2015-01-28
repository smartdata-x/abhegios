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
#import "MyIndexPath.h"
#define kMaxRowNum 4
#define kEmblemSection 0
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if( section == kEmblemSection )
        return 0;
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == kEmblemSection) {
        if( [indexPath row] == 1 )
            return 152;
        return 80;
    }
    return 90;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [[_tableViewData groups] count] + 1;
}

-(GroupInfo*) getGroupInfo:(NSInteger)section
{
    return [[_tableViewData groups] objectAtIndex:section-1];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ( section == kEmblemSection )
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
    GroupInfo* groupInfo = [self getGroupInfo:section];
    NSInteger count = [[groupInfo entitys] count];
    count = count/kMaxRowNum + (count % kMaxRowNum != 0 ? 1 : 0);
    return count;
}

-(NSArray*) getAppInfosToGroup:(NSIndexPath *)indexPath
{
    GroupInfo* groupInfo = [self getGroupInfo:[indexPath section]];
    NSInteger start = [indexPath row] * kMaxRowNum;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSInteger i = start; i < [[groupInfo entitys] count] && i < start + kMaxRowNum ; ++i)
    {
        [array addObject:[[groupInfo entitys] objectAtIndex:i]];
    }
    return array;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OEZTableViewCell *cell = nil;
    
    if ([indexPath section] == kEmblemSection ) {
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
        [cell setData:[self getAppInfosToGroup:indexPath]];
    }
    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if( section != kEmblemSection )
    {
        TableViewHeader* view = [TableViewHeader loadFromNib];
        [[view title] setText:[[self getGroupInfo:section] title]];
        return view;
    }
    return Nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section] == kEmblemSection)
    {
         [self.navigationController pushAppDetailsViewController:[_tableViewData emblem] animated:YES ];
    }
    else
    {
        if( [indexPath isKindOfClass:[MyIndexPath class]])
        {
            GroupInfo* groupInfo = [self getGroupInfo:[indexPath section]];
            NSInteger row =  indexPath.row + [(MyIndexPath*)indexPath section1] * kMaxRowNum;
            [self.navigationController pushAppDetailsViewController:[[groupInfo entitys] objectAtIndex:row] animated:YES ];
        }
    }
}
@end
