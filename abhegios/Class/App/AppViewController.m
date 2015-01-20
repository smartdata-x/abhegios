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
#import "AppTableViewCellSytle1.h"
@interface AppViewController ()
{
    AppStoreHome* _appStoreHome;
}
@end

@implementation AppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.tableView setSectionHeaderHeight:3z];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_appStoreHome list] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if( section == 0 )
        return 0;
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    AppInfoGroup *group = [[_appStoreHome list] objectAtIndex:section];
    if( [[group key] isEqual:@"advert"] || [[group key] isEqual:@"important"] || [[group key] isEqual:@"specialtopics"])
        return [[group list] count] > 0 ? 1 : 0;
    return [[group list] count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AppTableViewCellSytle1 *cell = [tableView dequeueReusableCellWithIdentifier:@"AppTableViewCellSytle1"];
    AppInfoGroup *group = [[_appStoreHome list] objectAtIndex:indexPath.section];
    AppInfo* appInfo = [[group list] objectAtIndex:indexPath.row];
    //[[cell textLabel] setText:[appInfo name]];
    [cell setData:appInfo];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 22)];
    [view setBackgroundColor:kUIColorWithRGB(0xf3f3f3)];
    if( section != 0 )
    {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [label setText:[[[_appStoreHome list] objectAtIndex:section] title]];
        [label setFont:[UIFont systemFontOfSize:14.0f]];

        [view addSubview:label];
    }
    return view;
}


@end
