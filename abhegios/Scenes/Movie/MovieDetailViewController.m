//
//  MovieDetailViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/30.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieDetailInfo.h"
#import "GroupInfo.h"
#import "AppAPIHelper.h"
#import "FavRateViewStyle.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MovieDetailViewController ()
@property MovieInfo* movieInfo;
@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didRequest {
    [[[AppAPIHelper shared] getMovieAPI] getMovieDetails:_movieInfo.id delegate:self];
}

- (void)setData:(id)data {
    _movieInfo = data;
    [self.navigationItem setTitle:_movieInfo.name];
}

- (void)gotoFullScreenPlayer:(NSString *)strurl {
    NSURL *movieUrl = [NSURL URLWithString:@"http://pl.youku.com/playlist/m3u8?ctype=12&ep=eiaWHUGMVMkB5SDcjT8bMiXiJiNZXJZ1gkSA%2fLYbScV%2bPerQkT7TwA%3d%3d&ev=1&keyframe=1&oip=3078655741&sid=842781271033512e90bdf&token=8027&type=flv&vid=XODk5MTIyNjE2"];
    MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL:movieUrl];
    [self presentMoviePlayerViewControllerAnimated:player];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (float)heightForSummary {
    MovieDetailInfo *detailInfo = _tableViewData;
    MovieDetail *detail = detailInfo.summary;
    float height = 10;
    if (detail) {
        NSString *content = [detail content];
        CGSize size = CGSizeMake(kMainScreenWidth - 20, MAXFLOAT);
        NSDictionary *attribute = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17.0f], NSFontAttributeName, nil];
        CGSize labelSize = [content boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
        height = labelSize.height + 20;
    }
    return height;
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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 1;
    if (section == 3) {
        MovieDetailInfo *detailInfo = _tableViewData;
        rows = [detailInfo.about count] / 2;
    }
    return rows;
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
        case 1: return [self heightForSummary]; break;
        case 2: return 80; break;
        case 3: return 160; break;
        default: return 0; break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    NSString *title = nil;
    MovieDetailInfo *detailInfo = _tableViewData;
    MovieDetail *detail = detailInfo.summary;
    
    switch (section) {
        case 1: title = @"内容介绍"; break;
        case 2: title = @"相关广告"; break;
        case 3: title = @"相关视频"; break;
        default: break;
    }
    if (title) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 21)];
        [view setBackgroundColor:[UIColor clearColor]];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [label setText:title];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [view addSubview:label];
        
        if (section == 1) {
            // 添加点赞
            FavRateViewStyle *rateview = [FavRateViewStyle loadFromNib];
            [rateview setFrame:CGRectMake(CGRectGetWidth(view.frame) - 80 - 40, 5, 80, 12)];
            [rateview setData:detail.star];
            [view addSubview:rateview];
            
            UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(view.frame) - 40, 2, 18, 18)];
            [imageview setImage:[UIImage imageNamed:@"follow_ico.png"]];
            [view addSubview:imageview];
        }
    }
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = nil;
    id data = nil;
    MovieDetailInfo *movieDetailInfo = _tableViewData;
    NSString *cellIdentifier = [NSString stringWithFormat:@"MovieDetailTableViewCellStyle%d", indexPath.section+1];
    viewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    switch (indexPath.section) {
        case 0:
        case 1: data = movieDetailInfo.summary; break;
        case 2: data = movieDetailInfo.advert; break;
        case 3: data = movieDetailInfo.about; break;
        default: break;
    }
    
    if (data) {
        if (IS_SECTION(3)) {
            NSInteger startIndex = indexPath.row * 2;
            NSArray *movieArray = [[NSArray alloc] initWithObjects:[data objectAtIndex:startIndex], [data objectAtIndex:startIndex+1], nil];
            [viewCell setData:movieArray];
            MovieDetailTableViewCellStyle4 *styleView = (MovieDetailTableViewCellStyle4 *)viewCell;
            styleView.delegate = self;
        }
        else {
            [viewCell setData:data];
        }
        return viewCell;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AppDetailsTableViewCellStyleNone"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (IS_SECTION(0)) {
        MovieDetailInfo *movieDetailInfo = _tableViewData;
        MovieDetail *detail = movieDetailInfo.summary;
        [self gotoFullScreenPlayer:detail.url];
    }
}
@end
