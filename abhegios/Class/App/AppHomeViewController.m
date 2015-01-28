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

-(void) testData
{
    _tableViewData = [GroupInfo initWithsConfigAndDataJsonFile:@"appstorehome" jsonName:@"appstorehome_test" entityClass:[AppInfo class]];
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
    GroupInfo *group = [_tableViewData objectAtIndex:section];
    if( [group style] == AppTableViewCellStyleTwo )
        return 0;
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     GroupInfo *group = [_tableViewData objectAtIndex:indexPath.section];
    if ( group.style == AppTableViewCellStyleThree) {
        return 90;
    }
    return 80;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupInfo *group = [_tableViewData objectAtIndex:section];
    if ( [self isSingleLine:group] ) {
        return [[group entitys] count] > 0 ? 1 : 0;
    }
    return [[group entitys] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupInfo *group = [_tableViewData objectAtIndex:[indexPath section]];
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
    UIView *view = nil;
    if( section != 0 )
    {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 22)];
        [view setBackgroundColor:kUIColorWithRGB(0xf3f3f3)];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, kMainScreenWidth-20, 21)];
        [label setText:[[_tableViewData objectAtIndex:section] title]];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [view addSubview:label];
    }
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GroupInfo *group = [_tableViewData objectAtIndex:[indexPath section]];
    [self.navigationController pushAppDetailsViewController:[[group entitys] objectAtIndex:[indexPath row] ] animated:YES ];
}

@end
