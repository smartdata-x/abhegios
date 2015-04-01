//
//  MovieSearchResultViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieSearchResultViewController.h"
#import "AppAPIHelper.h"
#import "GroupInfo.h"
#import "MovieInfo.h"
#import "MovieSearchResultTableViewCellStyle1.h"
#import "MovieDetailViewController.h"

@interface MovieSearchResultViewController ()
@property NSInteger typeID;
@property BOOL isHotShown;
@property UIButton *btnHot;
@property UIButton *btnNew;
@end

@implementation MovieSearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didRequest {
    [[[AppAPIHelper shared] getMovieAPI] getMovieSearchResult:_typeID delegate:self];
}

- (void)setData:(NSInteger)data {
    _typeID = data;
    NSArray *names = [[NSArray alloc] initWithObjects:@"推荐视频", @"原创视频", @"搞笑视频", @"游戏视频", @"科技视频", nil];
    [self.navigationItem setTitle:[names objectAtIndex:_typeID - 1001]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setHot {
    _isHotShown = YES;
    [_btnHot setBackgroundColor:kUIColorWithRGB(0x549bd0)];
    [_btnNew setBackgroundColor:kUIColorWithRGB(0xe7e0e1)];
    [self.tableView reloadData];
}

- (void)setNew {
    _isHotShown = NO;
    [_btnNew setBackgroundColor:kUIColorWithRGB(0x549bd0)];
    [_btnHot setBackgroundColor:kUIColorWithRGB(0xe7e0e1)];
    [self.tableView reloadData];
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    
    GroupInfo *movieGroup = [_tableViewData objectAtIndex:(_isHotShown ? 4 : 5)];
    NSInteger count = [[movieGroup entitys] count];
    return count / 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (IS_SECTION(0)) {
        return 49;
    }
    return 160;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = nil;
    NSString *identifier = [NSString stringWithFormat:@"MovieSearchResultTableViewCellStyle%d", indexPath.section+1];
    GroupInfo *group = [_tableViewData objectAtIndex:(_isHotShown ? 4 : 5)];
    if (group && [[group entitys] count] > 0) {
        viewCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (IS_SECTION(0)) {
            MovieSearchResultTableViewCellStyle1 *resultview = (MovieSearchResultTableViewCellStyle1 *)viewCell;
            [resultview.btnHot addTarget:self action:@selector(setHot) forControlEvents:UIControlEventTouchUpInside];
            [resultview.btnNew addTarget:self action:@selector(setNew) forControlEvents:UIControlEventTouchUpInside];
            _btnHot = resultview.btnHot;
            _btnNew = resultview.btnNew;
        }
        else if (IS_SECTION(1)) {
            // 只从第二个开始显示
            NSInteger startIndex = indexPath.row * 2;
            NSMutableArray *movieArray = [[NSMutableArray alloc] initWithObjects:[[group entitys] objectAtIndex:startIndex], [[group entitys] objectAtIndex:startIndex+1], nil];
            [viewCell setData:movieArray];
            MovieSearchResultTableViewCellStyle2 *resultview = (MovieSearchResultTableViewCellStyle2 *)viewCell;
            resultview.delegate = self;
        }
        return viewCell;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AppDetailsTableViewCellStyleNone"];
}

@end
