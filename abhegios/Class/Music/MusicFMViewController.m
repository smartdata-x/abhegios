//
//  MusicFMTableViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicFMViewController.h"
#import "MusicInfoViewStyle3.h"
#import "MusicFMTableViewCellStyle1.h"
#import "GroupInfo.h"
#import "MusicFMInfo.h"

@interface MusicFMViewController ()
@property (nonatomic, retain) NSArray *sectionInfo;
@end

@implementation MusicFMViewController
{
    UIImageView *animateView;
    NSTimer *timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavBar];
    [self initMusicPlayer];
    [self initTableView];
    _sectionInfo = [GroupInfo initWithsConfigAndDataJsonFile:@"musicfm" jsonName:@"musicfm" entityClass:[MusicFMInfo class]];
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateAnimateView) userInfo:self repeats:YES];
        [timer fire];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    PlayerInstance.delegate = self;
    [_player updateScreen];
}

- (void)initNavBar {
    MusicInfoViewStyle3 *viewStyle3 = [MusicInfoViewStyle3 loadFromNib];
    [viewStyle3 setData:@"发现音乐" Right:@"我的FM" LeftMajor:NO];
    [viewStyle3.leftButton addTarget:self action:@selector(backToMusicRoom) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = viewStyle3;
}

- (void)initMusicPlayer {
    _player = [MusicInfoViewStyle2 loadFromNib];
    CGRect frame = CGRectMake(0, kMainScreenHeight-50-64, CGRectGetWidth(_player.frame), 50);
    [_player setFrame:frame];
    [_player.trash addTarget:self action:@selector(doTrash:) forControlEvents:UIControlEventTouchUpInside];
    [_player.love addTarget:self action:@selector(doLove:) forControlEvents:UIControlEventTouchUpInside];
    [_player.next addTarget:self action:@selector(doNext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_player];
}

- (void)initTableView {
    _tableView.delegate = self;
    _tableView.dataSource = self;
    // 底部清除掉
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    [_tableView setTableFooterView:v];
}

- (void)updateAnimateView {
    if (animateView) {
        static int frame = 0;
        NSString *imgName = [NSString stringWithFormat:@"audio_icon%d.png", frame+1];
        [animateView setImage:[UIImage imageNamed:imgName]];
        frame++;
        frame = frame % 3;
    }
}

- (void)backToMusicRoom {
    [self.navigationController popViewControllerAnimated:YES];
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
        [_player updateScreen];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_sectionInfo count] + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 49;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame)-20, 21)];
    [view setBackgroundColor:kUIColorWithRGB(0xf3f3f3)];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 14, CGRectGetWidth(self.tableView.frame)-20, 21)];
    if (section == 0) {
        [label setText:@"个人兆赫"];
    }
    else {
        [label setText:[[_sectionInfo objectAtIndex:section-1] title]];
    }
    [label setFont:[UIFont systemFontOfSize:14.0f]];
    [view addSubview:label];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    else {
        return [[[_sectionInfo objectAtIndex:section-1] entitys] count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OEZTableViewCell *viewCell = nil;
    viewCell = [tableView dequeueReusableCellWithIdentifier:@"MusicFMTableViewCellStyle1"];
    if (IS_SECTION(0)) {
        NSString *name = indexPath.row == 0 ? @"我的红心" : @"推荐偏好";
        [viewCell setData:name];
    }
    else {
        GroupInfo *group = [_sectionInfo objectAtIndex:indexPath.section-1];
        NSString *name = [[[group entitys] objectAtIndex:indexPath.row] strSid];
        [viewCell setData:name];
    }
    
    MusicFMTableViewCellStyle1 *cellStyle1 = (MusicFMTableViewCellStyle1 *)viewCell;
    NSArray *loc = [MusicFMInfo getLocationFromGroupinfo:_sectionInfo Dimension:[PlayerInstance dimension] Sid:[PlayerInstance sid]];
    NSInteger musicDimension = [[loc objectAtIndex:0] integerValue];
    NSInteger musicSid = [[loc objectAtIndex:1] integerValue];
    if (musicDimension+1 == indexPath.section && musicSid == indexPath.row) {
        animateView = cellStyle1.logo;
        [cellStyle1.logo setHidden:NO];
    }
    else {
        [cellStyle1.logo setHidden:YES];
    }
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section > 0) {
        NSString *dimension = [[_sectionInfo objectAtIndex:indexPath.section-1] key];
        NSInteger sid = [[[[_sectionInfo objectAtIndex:indexPath.section-1] entitys] objectAtIndex:indexPath.row] sid];
        [PlayerInstance setMusicParams:dimension Sid:sid ForceReload:YES];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
