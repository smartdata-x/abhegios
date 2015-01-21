//
//  AppViewController.m
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppViewController.h"
#import "AppStoreHome.h"
#import "AppInfoGroup.h"
#import "AppInfo.h"
#import "AppTableViewCellStyle1.h"
@interface AppViewController ()
{
    AppStoreHome* _appStoreHome;
}
@end

@implementation AppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testData];

}

-(void) testData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"appstorehome_test" ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    id json =[NSJSONSerialization JSONObjectWithData:data
                                             options:NSJSONReadingAllowFragments
                                               error:&error];
    if( json != nil && [json isKindOfClass:[NSDictionary class]] )
    {
        _appStoreHome = [[AppStoreHome alloc] init:[json objectForKey:@"result"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) isSingleLine:(AppInfoGroup*) group
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
    return [[_appStoreHome appInfoGroups] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    AppInfoGroup *group = [[_appStoreHome appInfoGroups] objectAtIndex:section];
    if( [group style] == AppTableViewCellStyleTwo )
        return 0;
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    AppInfoGroup *group = [[_appStoreHome appInfoGroups] objectAtIndex:section];
    if ( [self isSingleLine:group] ) {
        return [[group appInfos] count] > 0 ? 1 : 0;
    }
    return [[group appInfos] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AppInfoGroup *group = [[_appStoreHome appInfoGroups] objectAtIndex:[indexPath section]];
    BaseTableViewCell* viewCell = nil;
    if ( [self isSingleLine:group])
    {
        viewCell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"AppTableViewCellStyle%u",[group style]]];
        [viewCell setData:group];
    }
    else{
        viewCell = [tableView dequeueReusableCellWithIdentifier:@"AppTableViewCellStyle1"];
        [viewCell setData:[[group appInfos] objectAtIndex:indexPath.row]];
    }
    return viewCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    if( section != 0 )
    {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 22)];
        [view setBackgroundColor:kUIColorWithRGB(0xf3f3f3)];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [label setText:[[[_appStoreHome appInfoGroups] objectAtIndex:section] title]];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [view addSubview:label];
    }
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"AppDetailsViewController"] animated:TRUE];
}

@end
