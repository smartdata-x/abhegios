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

@interface MovieCenterViewController ()

@end

@implementation MovieCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didRequest {
    [[[AppAPIHelper shared] getMovieAPI] getMovieStore:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger count = [_tableViewData count];
    count = count <= 0 ? 0 : count;
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 2;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 0;
    }
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (IS_SECTION(0)) {
        return 80;
    }
    else if (IS_SECTION(1) && IS_ROW(0)) {
        return 180;
    }
    return 160;
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
    
    if (IS_SECTION(0)) {
        viewCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCenterTableViewCellStyle3"];
        [viewCell setData:group];
    }
    else if (IS_SECTION(1)) {
        if (IS_ROW(0)) {
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCenterTableViewCellStyle2"];
            [viewCell setData:group];
        }
        else {
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCenterTableViewCellStyle1"];
            // 只从第二个开始显示
            NSArray *movieArray = [[NSArray alloc] initWithObjects:[[group entitys] objectAtIndex:1], [[group entitys] objectAtIndex:2], nil];
            [viewCell setData:movieArray];
        }
    }
    else {
        viewCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCenterTableViewCellStyle1"];
        [viewCell setData:[group entitys]];
    }
    
    return viewCell;
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
