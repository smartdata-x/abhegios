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

@interface MovieSearchResultViewController ()
@property NSInteger typeID;
@property BOOL isHotShown;
@end

@implementation MovieSearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didRequest {
    [[[AppAPIHelper shared] getMovieAPI] getMovieSearchResult:_typeID delegate:self];
}

- (void)setData:(NSInteger)data {
    _typeID = data;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = nil;
    NSString *identifier = [NSString stringWithFormat:@"MovieSearchResultTableViewCellStyle%d", indexPath.section];
    GroupInfo *group = [_tableViewData objectAtIndex:(_isHotShown ? 4 : 5)];
    if (group) {
        viewCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (IS_SECTION(1)) {
            // 只从第二个开始显示
            NSInteger startIndex = indexPath.row * 2;
            NSArray *movieArray = [[NSArray alloc] initWithObjects:[[group entitys] objectAtIndex:startIndex], [[group entitys] objectAtIndex:startIndex+1], nil];
            [viewCell setData:movieArray];
        }
        return viewCell;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AppDetailsTableViewCellStyleNone"];
}

@end
