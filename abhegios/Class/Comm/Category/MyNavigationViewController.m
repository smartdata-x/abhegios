//
//  MyNavigationViewController.m
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MyNavigationViewController.h"
#import "AppDetailsViewController.h"
#import "AppInfo.h"
@implementation MyNavigationViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    //[self.navigationBar setBarTintColor:kUIColorWithRGB(0x339ee2)];
}


-(void) pushAppDetailsViewController:(AppInfo*) appInfo animated:(BOOL)animated
{
    [self pushViewControllerWithIdentifier:@"AppDetailsViewController" completion:^(UIViewController *viewController) {
        [(AppDetailsViewController*)viewController setAppInfo:appInfo];
    } animated:YES];
}
@end
