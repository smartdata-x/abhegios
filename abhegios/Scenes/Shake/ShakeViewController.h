//
//  ShakeViewController.h
//  abhegios
//
//  Created by yaobanglin on 15/4/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
@interface ShakeViewController : UIViewController
{
    SystemSoundID _soundID;
}
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (weak, nonatomic) IBOutlet UIView *bottom;
@property (weak, nonatomic) IBOutlet UIView *top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topImageConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomImageConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomImageTopConstraint;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UIView *shakeInfo;

@end

