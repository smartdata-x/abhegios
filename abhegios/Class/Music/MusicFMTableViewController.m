//
//  MusicFMTableViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicFMTableViewController.h"

@interface MusicFMTableViewController ()
@property (nonatomic, retain) NSArray *sectionInfo;
@end

@implementation MusicFMTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_player.trash addTarget:self action:@selector(doTrash:) forControlEvents:UIControlEventTouchUpInside];
    [_player.love addTarget:self action:@selector(doLove:) forControlEvents:UIControlEventTouchUpInside];
    [_player.next addTarget:self action:@selector(doNext:) forControlEvents:UIControlEventTouchUpInside];
    PlayerInstance.delegate = self;
    _sectionInfo = [NSArray arrayWithObjects:@"个人兆赫", @"频道兆赫", @"心情兆赫", nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [_player updateScreen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doNext:(id)sender {
    [PlayerInstance doNext];
}

- (IBAction)doTrash:(id)sender {
    
}

- (IBAction)doLove:(id)sender {
    
}

- (void)MusicPlayerHelperStateChange:(NSInteger)state {
    if (state == MusicPlayerHelperStateNext) {
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_sectionInfo count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 49;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame)-20, 21)];
    [view setBackgroundColor:kUIColorWithRGB(0xf3f3f3)];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 14, CGRectGetWidth(self.tableView.frame)-20, 21)];
    [label setText:[_sectionInfo objectAtIndex:section]];
    [label setFont:[UIFont systemFontOfSize:14.0f]];
    [view addSubview:label];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = nil;
    viewCell = [tableView dequeueReusableCellWithIdentifier:@"MusicFMTableViewCellStyle1"];
    if (IS_SECTION(0)) {
        NSString *name = indexPath.row == 0 ? @"我的红心" : @"推荐偏好";
        [viewCell setData:name];
    }
    else {
        NSString *name = indexPath.row == 0 ? @"华语流行" : @"粤语经典";
        [viewCell setData:name];
    }
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *dimension = @"";
    NSInteger sid = 1;
    [PlayerInstance setMusicParams:dimension Sid:sid];
}

@end
