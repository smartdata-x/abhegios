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
    _sectionInfo = [NSArray arrayWithObjects:@"个人兆赫", @"频道兆赫", @"心情兆赫", nil];
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
    if (state == MusicPlayerHelperStatePlay) {
        [_player updateScreen];
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
        if (indexPath.row == 0) {
            // 单独获取imageview
            MusicFMTableViewCellStyle1 *cellStyle1 = (MusicFMTableViewCellStyle1 *)viewCell;
            animateView = cellStyle1.logo;
            [animateView setHidden:NO];
        }
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
