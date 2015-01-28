//
//  AppViewController.m
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppHomeViewController.h"
#import "GroupInfo.h"
#import "AppInfo.h"
#import "AppTableViewCellStyle1.h"
#import <OEZCommSDK/OEZCommSDK.h>
#import "AppAPIHelper.h"
@interface AppHomeViewController ()
{
    
}
@end

@implementation AppHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void) didRequest
{
    [[[AppAPIHelper shared] getApplyAPI] getAppStoreHome:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) isSingleLine:(GroupInfo*) group
{
    switch ([group style]) {
        case AppTableViewCellStyleTwo:
        case AppTableViewCellStyleThree:
        case AppTableViewCellStyleFour:
            return YES;
        default:
            return NO;
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_tableViewData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    GroupInfo *group = [self getGroupInfo:section];;
    if( [group style] == AppTableViewCellStyleTwo )
        return 0;
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     GroupInfo *group =[self getGroupInfo:[indexPath section]];;
    if ( group.style == AppTableViewCellStyleThree) {
        return 90;
    }
    return 80;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupInfo *group = [self getGroupInfo:section];
    if ( [self isSingleLine:group] ) {
        return [[group entitys] count] > 0 ? 1 : 0;
    }
    return [[group entitys] count];
}

-(GroupInfo*) getGroupInfo:(NSInteger)section
{
    return [_tableViewData objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupInfo *group = [self getGroupInfo:[indexPath section]];
    OEZTableViewCell* viewCell = nil;
    if ( [self isSingleLine:group])
    {
        viewCell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"AppTableViewCellStyle%@",@([group style])]];
        [viewCell setData:[group entitys]];
        [viewCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    else{
        viewCell = [tableView dequeueReusableCellWithIdentifier:@"AppTableViewCellStyle1"];
        [viewCell setData:[[group entitys] objectAtIndex:indexPath.row]];
    }
    return viewCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if( section != 0 )
    {
        TableViewHeader* view = [TableViewHeader loadFromNib];
        [[view title] setText:[[self getGroupInfo:section] title]];
        return view;
    }
    return Nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GroupInfo *group = [self getGroupInfo:[indexPath section]];
    [self.navigationController pushAppDetailsViewController:[[group entitys] objectAtIndex:[indexPath row] ] animated:YES ];
}

@end
