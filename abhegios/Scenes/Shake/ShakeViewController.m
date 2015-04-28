//
//  ShakeViewController.m
//  abhegios
//
//  Created by yaobanglin on 15/4/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "ShakeViewController.h"

@interface ShakeViewController ()<UITabBarDelegate>

@end

@implementation ShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"摇一摇"];
    [_tabBar setSelectedItem:[_tabBar.items objectAtIndex:1]];
    [_topImageConstraint setConstant:-2.5];
    [_bottomImageConstraint setConstant:0.5];
    [_bottomImageTopConstraint setConstant:-1.5];
    
    
    // Do any additional setup after loading the view.
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

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    
    //检测到摇动
    
}



- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    
    //摇动取消
    
}



- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    
    //摇动结束
    
    if (event.subtype == UIEventSubtypeMotionShake) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"shake_male" ofType:@"mp3"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &_soundID);
        AudioServicesPlaySystemSound(_soundID);
        CGRect oldTopRect = [_top frame];
        CGRect oldBottomRect = [_bottom frame];
        CGRect newTopRect = [_top frame];
        newTopRect.origin.y -= 59.5;
        CGRect newBottomRect = [_bottom frame];
        newBottomRect.origin.y += 59.5;
        [UIView animateWithDuration:0.5 animations:^{
            [_top setFrame:newTopRect];
            [_bottom setFrame:newBottomRect];

        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                [_top setFrame:oldTopRect];
                [_bottom setFrame:oldBottomRect];
            }];
        }];
        
        
    }
    
}

@end
