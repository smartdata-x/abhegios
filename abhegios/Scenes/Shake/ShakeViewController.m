//
//  ShakeViewController.m
//  abhegios
//
//  Created by yaobanglin on 15/4/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "ShakeViewController.h"
#import "AppAPIHelper.h"
#import "ReqeustDelegate.h"
#define kMoveHeight 59.5
#define KMoveDuration 0.5
@interface ShakeViewController ()<UITabBarDelegate,ReqeustDelegate>

@end

@implementation ShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"摇一摇"];
    [_tabBar setSelectedItem:[_tabBar.items objectAtIndex:1]];
    [_bottomImageTopConstraint setConstant:-1.5];
    [_topImageConstraint setConstant:-2.5];
    [_bottomImageConstraint setConstant:0.5];
}

-(void) reqeust:(id)reqeust didComplete:(id)data
{
   
}

-(void) reqeust:(id)reqeust didError:(NSError *)err
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger) selectIndex
{
    return [[_tabBar items] indexOfObject:[_tabBar selectedItem]];
}

-(void) didReqeust
{
    NSInteger selIdx = [self selectIndex];
    switch (selIdx) {
        case 0:
            break;
        case 1:
            [[[AppAPIHelper shared] getApplyAPI] shake:self];
            break;
        case 2:
            break;
        default:
            return;
    }
}
-(void) didShake
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shake_male" ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &_soundID);
    AudioServicesPlaySystemSound(_soundID);
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

@end
