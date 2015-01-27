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
@interface GameHomeViewController ()<ReqeustDelegate>
{
    GameHomeInfo *_gameHomeInfo;
}
@end

@implementation GameHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self request];
}

-(void) reqeust:(id)reqeust didComplete:(id)data
{
    _gameHomeInfo = data;
    [self.tableView reloadData];
}
-(void) reqeust:(id)reqeust didError:(NSError *)err
{
    
}

-(void) request
{
    [[[AppAPIHelper shared] getApplyAPI] getGameStoreHome:self];
}

-(void) test
{
    _gameHomeInfo = [GameHomeInfo initWithJsonResource:@"gamehomeinfo_test" ofType:@"json"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/
@end
