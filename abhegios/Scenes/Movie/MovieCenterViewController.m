//
//  MovieCenterViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieCenterViewController.h"
#import "MovieInfo.h"
#import "GroupInfo.h"
#import "AppAPIHelper.h"
#import "MovieDetailViewController.h"
#import "MovieSearchListViewController.h"

@interface MovieCenterViewController ()

@end

@implementation MovieCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSearchBarItem];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didRequest {
    [[[AppAPIHelper shared] getMovieAPI] getMovieStore:self];
}

- (void)addSearchBarItem {
    // 右按钮
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 19, 22)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"search_ico.png"] forState:UIControlStateNormal];
    //[rightButton setTitle:@"搜索" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(gotoMovieSearchList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

- (void)gotoMovieSearchList {
    [self.navigationController pushViewControllerWithIdentifier:@"MovieSearchListViewController" completion:^(UIViewController *viewController) {
    } animated:YES];
}

- (void)gotoMovieDetail:(MovieInfo *)movieInfo {
    [self.navigationController pushViewControllerWithIdentifier:@"MovieDetailViewController" completion:^(UIViewController *viewController) {
        MovieDetailViewController *detailView = (MovieDetailViewController *)viewController;
        [detailView setData:movieInfo];
    } animated:YES];
}

- (void)cellItemClickedAtIndex:(id)movieInfo {
    [self gotoMovieDetail:movieInfo];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger count = [_tableViewData count] - 2; // 去掉最新和最热
    count = count <= 0 ? 0 : count;
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupInfo *group = [_tableViewData objectAtIndex:section];
    NSInteger groupCount = [[group entitys] count];
    NSInteger rows = 0;
    switch (section) {
        case 0: rows = 1; break;
        case 1: rows = 1 + ceilf((groupCount - 1) / 2.0f); break;
        case 2:
        case 3: rows = ceilf(groupCount / 2.0f); break;
        default: break;
    }
    return rows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 0;
    }
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (IS_SECTION(0)) {
        return 185;
    }
    return 160;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    if (section != 0 && section != 1) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [view setBackgroundColor:kUIColorWithRGB(0xf0f0f0)];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [label setText:[[_tableViewData objectAtIndex:section] title]];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [label setTextColor:[UIColor lightGrayColor]];
        [view addSubview:label];
    }
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = nil;
    GroupInfo *group = [_tableViewData objectAtIndex:indexPath.section];
    
    if (IS_SECTION(0)) {
        viewCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCenterTableViewCellStyle3"];
        [viewCell setData:group];
    }
#if 0
    else if (IS_SECTION(1)) {
        if (IS_ROW(0)) {
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCenterTableViewCellStyle2"];
            [viewCell setData:group];
        }
        else {
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCenterTableViewCellStyle1"];
            // 只从第二个开始显示
            NSInteger startIndex = 1 + (indexPath.row - 1) * 2;
            NSArray *movieArray = [[NSArray alloc] initWithObjects:[[group entitys] objectAtIndex:startIndex], [[group entitys] objectAtIndex:startIndex+1], nil];
            [viewCell setData:movieArray];
            MovieCenterTableViewCellStyle1 *styleView = (MovieCenterTableViewCellStyle1 *)viewCell;
            styleView.delegate = self;
        }
    }
#endif
    else {
        viewCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCenterTableViewCellStyle1"];
        NSInteger startIndex = indexPath.row * 2;
        NSArray *movieArray = [[NSArray alloc] initWithObjects:[[group entitys] objectAtIndex:startIndex], [[group entitys] objectAtIndex:startIndex+1], nil];
        [viewCell setData:movieArray];
        MovieCenterTableViewCellStyle1 *styleView = (MovieCenterTableViewCellStyle1 *)viewCell;
        styleView.delegate = self;
    }
    
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GroupInfo *group = [_tableViewData objectAtIndex:indexPath.section];
    if (IS_SECTION(1) && IS_ROW(0)) {
        MovieInfo *movieInfo = [[group entitys] objectAtIndex:0];
        [self gotoMovieDetail:movieInfo];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
