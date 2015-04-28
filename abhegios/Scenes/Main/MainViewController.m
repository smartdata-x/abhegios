//
//  MainViewController.m
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MainViewController.h"
#import "ShakeViewController.h"
#import <OEZCommSDK/OEZCommSDK.h>
@interface MainViewController ()<UITabBarControllerDelegate>
{
    NSInteger  _lastSelectIndex;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:FALSE];
    [[self tabBar] setTranslucent:NO];
    [self setDelegate:self];
    _lastSelectIndex = 0;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController
{
    [self setTitle:[selectedViewController title]];
    [super setSelectedViewController:selectedViewController];
}


- (BOOL) tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[ShakeViewController class]]) {
        [self.navigationController pushViewControllerWithIdentifier:@"ShakeViewController" animated:YES];
        return NO;
    } else {
        return YES;
    }
}


@end
