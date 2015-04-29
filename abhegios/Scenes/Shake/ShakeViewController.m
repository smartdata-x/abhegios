//
//  ShakeViewController.m
//  abhegios
//
//  Created by yaobanglin on 15/4/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "ShakeViewController.h"
#import "ShakeTask.h"
#import "MyNavigationViewController.h"
#define kMoveHeight 59.5
#define KMoveDuration 0.5
#define kShakeMale 0
#define kShakeMatch 1
#define kShakeNoMatch 2
@interface ShakeViewController ()<UITabBarDelegate,ShakeTaskDelegate>
{
    NSArray *_soundIDs;
    UIView  *_infoView;
    UITapGestureRecognizer  *_tapGestureRec;
    ShakeTask *_task;
}
@end

@implementation ShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_tabBar setDelegate:self];
    [_tabBar setSelectedItem:[_tabBar.items objectAtIndex:1]];
    [_bottomImageTopConstraint setConstant:-1.5];
    [_topImageConstraint setConstant:-2.5];
    [_bottomImageConstraint setConstant:0.5];
    [_shakeInfo setHidden:YES];
    [[_shakeInfo layer] setBorderWidth:0.5];
    [[_shakeInfo layer] setBorderColor:[[UIColor grayColor] CGColor]];
    
    _tapGestureRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didShakeInfo:)];
    //默认禁用点击手势，当显示左侧菜单时启用
    [_shakeInfo setUserInteractionEnabled:YES];
    [_shakeInfo addGestureRecognizer:_tapGestureRec];
    [self initSounds];
    [self stopLoad];
}


-(IBAction) didShakeInfo:(id)sender
{
    [_task didNext];
}

-(void) initSounds
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    SystemSoundID soundID;
    NSString *path = nil;
    NSArray *mp3s = @[@"shake_male",@"shake_match",@"shake_nomatch"];
    for (NSString *name in mp3s) {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"mp3"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundID);
        [array addObject:@(soundID)];
    }
    _soundIDs = array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (BOOL)canBecomeFirstResponder
{
    return YES;
}


-(UIViewController*) callViewController:(ShakeTask*) shakeTask
{
    return self;
}

-(void) shakeTask:(ShakeTask *)shakeTask didComplete:(id)data view:(UIView *)view
{
    [_infoView removeFromSuperview];
    _infoView = view;
    [_infoView setFrame:CGRectMake(1, 0.5, CGRectGetWidth([_shakeInfo frame])-40, CGRectGetHeight([_shakeInfo frame])-1)];
    [_shakeInfo addSubview:_infoView];
    [_shakeInfo setHidden:NO];
    [self AudioServicesPlaySystemSound:kShakeMatch];
    AudioServicesDisposeSystemSoundID(kSystemSoundID_Vibrate);
}

-(void) shakeTask:(ShakeTask *)shakeTask didError:(NSError *)error
{
    [self stopLoad];
    [_tipsLabel setHidden:NO];
    NSString *stringError = [[error userInfo] objectForKey:NSLocalizedDescriptionKey];
    [_tipsLabel setText:stringError];
    [self AudioServicesPlaySystemSound:kShakeNoMatch];
    
}

-(NSInteger) selectIndex
{
    return [[_tabBar items] indexOfObject:[_tabBar selectedItem]];
}

-(void) stopLoad
{
    [_activityIndicator setHidden:YES];
    [_activityIndicator stopAnimating];
    [_tipsLabel setHidden:YES];
}

-(void) showLoad:(NSString*) msg
{
    [_activityIndicator setHidden:NO];
    [_activityIndicator startAnimating];
    [_tipsLabel setHidden:NO];
    [_tipsLabel setText:msg];
    [_shakeInfo setHidden:YES];
}

-(ShakeTask*) getShakeTask
{
    NSInteger selIdx = [self selectIndex];
    ShakeTaskType type = ShakeTaskNoneType;
    switch (selIdx) {
        case 0:
            type = ShakeTaskWIFIType;
            break;
        case 1:
            type = ShakeTaskAppType;
            break;
        case 2:
            type = ShakeTaskBeaconType;
            break;
    }
    if( type != ShakeTaskNoneType)
    {
        return  [ShakeTask shakeTaskFactory:type];
    }
    return nil;
}

-(void) didReqeust
{

    _task = [self getShakeTask];
    if( _task != nil)
    {
        [self showLoad:[NSString stringWithFormat:@"正在搜索%@信息",[_task description]]];
        [_task setDelegate:self];
        [self performSelector:@selector(startTask:) withObject:_task afterDelay:0.5];
    }

}

-(void) startTask:(ShakeTask*) task
{
    [task startReqeust];
}

-(void) AudioServicesPlaySystemSound:(NSInteger) idx
{
     AudioServicesPlaySystemSound([[_soundIDs objectAtIndex:idx] intValue]);
}
-(void) didShake
{
    [self stopLoad];
    [self AudioServicesPlaySystemSound:kShakeMale];
    CGRect oldTopRect = [_top frame];
    CGRect oldBottomRect = [_bottom frame];
    CGRect newTopRect = [_top frame];
    newTopRect.origin.y -= kMoveHeight;
    CGRect newBottomRect = [_bottom frame];
    newBottomRect.origin.y += kMoveHeight;
    [UIView animateWithDuration:KMoveDuration animations:^{
        [_top setFrame:newTopRect];
        [_bottom setFrame:newBottomRect];
        
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:KMoveDuration animations:^{
            [_top setFrame:oldTopRect];
            [_bottom setFrame:oldBottomRect];
            [self didReqeust];
        } completion:^(BOOL finished) {
            
        }];
    }];
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    //摇动结束
    if (event.subtype == UIEventSubtypeMotionShake)
    {
        [self didShake];
    }
    
}

-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [_shakeInfo setHidden:YES];
}

-(void) tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    //if( item != [tabBar selectedItem])
    {
        [self stopLoad];
        [_shakeInfo setHidden:YES];
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [_task prepareForSegue:segue sender:sender];
}

@end
