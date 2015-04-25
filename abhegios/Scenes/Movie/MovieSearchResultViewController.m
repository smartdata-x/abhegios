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
#define kMaxRowNum 2

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

- (void)setHot:(BOOL)noReload {
    _isHotShown = YES;
    [_btnHot setBackgroundColor:kUIColorWithRGB(0x549bd0)];
    [_btnNew setBackgroundColor:kUIColorWithRGB(0xe7e0e1)];
    [_btnHot setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnNew setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if (!noReload) [self.tableView reloadData];
}

- (void)setNew:(BOOL)noReload {
    _isHotShown = NO;
    [_btnNew setBackgroundColor:kUIColorWithRGB(0x549bd0)];
    [_btnHot setBackgroundColor:kUIColorWithRGB(0xe7e0e1)];
    [_btnNew setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnHot setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if (!noReload) [self.tableView reloadData];
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
        return 70;
    }
    return 160;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = nil;
    NSString *identifier = [NSString stringWithFormat:@"MovieSearchResultTableViewCellStyle%@", @(indexPath.section+1)];
    GroupInfo *group = [_tableViewData objectAtIndex:(_isHotShown ? 4 : 5)];
    if (group && [[group entitys] count] > 0) {
        viewCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (IS_SECTION(0)) {
            MovieSearchResultTableViewCellStyle1 *resultview = (MovieSearchResultTableViewCellStyle1 *)viewCell;
            [resultview.btnHot addTarget:self action:@selector(setHot:) forControlEvents:UIControlEventTouchUpInside];
            [resultview.btnNew addTarget:self action:@selector(setNew:) forControlEvents:UIControlEventTouchUpInside];
            _btnHot = resultview.btnHot;
            _btnNew = resultview.btnNew;
            _isHotShown ? [self setHot:YES] : [self setNew:YES];
        }
        else if (IS_SECTION(1)) {
            // 只从第二个开始显示
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCenterTableViewCellStyle1"];
            NSInteger startIndex = indexPath.row * kMaxRowNum;
            NSInteger len = MIN(kMaxRowNum, [[group entitys] count] - startIndex );
            NSRange range = NSMakeRange(startIndex, len);
            
            [viewCell setData:[[group entitys] subarrayWithRange:range]];
            MovieSearchResultTableViewCellStyle2 *resultview = (MovieSearchResultTableViewCellStyle2 *)viewCell;
            resultview.delegate = self;
        }
        return viewCell;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AppDetailsTableViewCellStyleNone"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
