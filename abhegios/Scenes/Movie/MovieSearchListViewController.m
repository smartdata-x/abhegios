//
//  MovieSearchListViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieSearchListViewController.h"
#import "MovieSearchResultViewController.h"

@interface MovieSearchListViewController ()

@end

@implementation MovieSearchListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gotoSearchResultView:(NSInteger)typeID {
    [self.navigationController pushViewControllerWithIdentifier:@"MovieSearchResultViewController" completion:^(UIViewController *viewController) {
        MovieSearchResultViewController *resultView = (MovieSearchResultViewController *)viewController;
        [resultView setData:typeID];
    } animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *names = [[NSArray alloc] initWithObjects:@"推荐视频", @"原创视频", @"搞笑视频", @"游戏视频", @"科技视频", nil];
    OEZTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:@"MovieSearchListTableViewCellStyle1"];
    [viewCell setData:[names objectAtIndex:indexPath.row]];
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger searchID = 1001 + indexPath.row;
    [self gotoSearchResultView:searchID];
}

@end
