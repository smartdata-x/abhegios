//
//  MovieDetailViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/30.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieInfo.h"
#import "GroupInfo.h"
#import "AppAPIHelper.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didRequest {
    [[[AppAPIHelper shared] getMovieAPI] getMovieDetails:2 delegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: return 180; break;
        case 1: return 200; break;
        case 2: return 80; break;
        case 3: return 160; break;
        default: return 0; break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    if (section != 0 && section != 1) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [view setBackgroundColor:kUIColorWithRGB(0xf3f3f3)];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [label setText:[[_tableViewData objectAtIndex:section] title]];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [view addSubview:label];
    }
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = nil;
    GroupInfo *group = [_tableViewData objectAtIndex:indexPath.section];
    NSString *cellIdentifier = [NSString stringWithFormat:@"MovieDetailTableViewCellStyle%d.h", indexPath.section];
    viewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [viewCell setData:[group entitys]];
    return viewCell;
}
@end
