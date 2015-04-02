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

-(NSInteger) numberOfEmblemSection
{
    if( [_tableViewData emblem] != nil )
    {
        if ( [[[_tableViewData emblem] pic] count] > 0) {
            return 3;
        }
        return 2;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == kEmblemSection) {
        if (  [indexPath row] == [self numberOfEmblemSection] - 1 )
        {
            return 44;
        }
        else if( [indexPath row] == 1 )
            return 152;
        else
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
        return [self numberOfEmblemSection];
    }
    GroupInfo* groupInfo = [self getGroupInfo:section];
    NSInteger count = [[groupInfo entitys] count];
    count = count/kMaxRowNum + (count % kMaxRowNum != 0 ? 1 : 0);
    return count;
}

-(NSArray*) getAppInfosToGroup:(NSIndexPath *)indexPath
{
    GroupInfo* groupInfo = [self getGroupInfo:[indexPath section]];
    NSInteger start =  [indexPath row] * kMaxRowNum;
    NSInteger len = MIN(kMaxRowNum, [[groupInfo entitys] count] - start );
    NSRange range = NSMakeRange(start, len);
    return [[groupInfo entitys] subarrayWithRange:range ];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OEZTableViewCell *cell = nil;
    
    if ([indexPath section] == kEmblemSection ) {
        
         if (  [indexPath row] == [self numberOfEmblemSection] - 1 )
         {
             cell = [tableView dequeueReusableCellWithIdentifier:@"GameHomeTableViewCell4"];
         }
         else if( [indexPath row] == 1 )
         {
             cell = [tableView dequeueReusableCellWithIdentifier:@"GameHomeTableViewCell2"];
             [cell setData:[[_tableViewData emblem] pic]];
         }
        else
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"GameHomeTableViewCell1"];
            [cell setData:[_tableViewData emblem]];
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


-(void) tableView:(UITableView *)tableView rowAtIndexPath:(NSIndexPath *)indexPath didSelectColumnAtIndex:(NSInteger)column
{
   if ([indexPath section] == kEmblemSection)
   {
       
   }
    else
    {
         GroupInfo* groupInfo = [self getGroupInfo:[indexPath section]];
         NSInteger row = column + [indexPath row] * kMaxRowNum;
         [self.navigationController pushAppDetailsViewController:[[groupInfo entitys] objectAtIndex:row] animated:YES ];
    }
}


-(void) tableView:(UITableView *)tableView rowAtIndexPath:(NSIndexPath *)indexPath didAction:(NSInteger)action
{
     if ([indexPath section] == kEmblemSection)
     {
          [[[AppAPIHelper shared] getApplyAPI] getWanted:[[_tableViewData emblem] id] delegate:nil];
     }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section] == kEmblemSection)
    {
        if (  [indexPath row] == [self numberOfEmblemSection] - 1 )
        {
            
        }
        else
        {
            [self.navigationController pushAppDetailsViewController:[_tableViewData emblem] animated:YES ];
        }
    }
}
@end
