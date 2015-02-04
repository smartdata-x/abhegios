//
//  RecommendViewController.m
//  abhegios
//
//  Created by 180 on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "RecommendViewController.h"
#import "GroupInfo.h"
#import "AppAPIHelper.h"
#import "BaseInfo.h"
#import "AppInfo.h"
#import "BookInfo.h"
#import "SearchView.h"
#import "BookDetailInfoTableViewController.h"
typedef NS_ENUM(NSInteger, AppTableViewCellStyle) {
    RecommendTableViewCellStyleNone = 0,
    RecommendTableViewCellStyleOne,
    RecommendTableViewCellStyleTwo
};

@interface RecommendViewController ()
{
    SearchView* _searchView;
}
@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchView = [SearchView loadFromNib];
    [self.tableView setTableHeaderView:_searchView];
}


-(void) didRequest
{
    [[[AppAPIHelper shared] getOtherAPI] getRecommendHome:self];
}


-(BOOL) isSingleLine:(GroupInfo*) group
{
    switch ([group style]) {
        case RecommendTableViewCellStyleTwo:
            return YES;
        default:
            return NO;
    }
}

-(GroupInfo*) getGroupInfo:(NSInteger)section
{
    return [_tableViewData objectAtIndex:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    GroupInfo *group = [self getGroupInfo:section];
    if( [group style] == RecommendTableViewCellStyleTwo )
        return 0;
    return 22;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_tableViewData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupInfo *group = [self getGroupInfo:indexPath.section];
    if ( group.style == RecommendTableViewCellStyleTwo) {
        return 100;
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
    GroupInfo *group = [self getGroupInfo:[indexPath section]];
    if ( [group style] <= RecommendTableViewCellStyleTwo) {
         OEZTableViewCell* viewCell =  [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"RecommendTableViewCellStyle%@",@([group style])]];
        if( [group style] == RecommendTableViewCellStyleTwo )
        {
            [viewCell setData:[group entitys]];
            [viewCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        else
            [viewCell setData:[[group entitys] objectAtIndex:indexPath.row]];
        return viewCell;
    }
      return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RecommendTableViewCellStyleNone"];
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
    BaseInfo* baseInfo = [[[self getGroupInfo:[indexPath section]]entitys] objectAtIndex:[indexPath row]];
    if( [baseInfo isKindOfClass:[AppInfo class]])
        [self.navigationController pushAppDetailsViewController:baseInfo animated:YES ];
    else if (  [baseInfo isKindOfClass:[BookInfo class]] )
    {
       
        [self.navigationController pushBookDetailsViewController:baseInfo animated:YES];
    }
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_searchView resignFirstResponder];
}

@end
