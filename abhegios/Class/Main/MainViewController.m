//
//  MainViewController.m
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:FALSE];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController {
    [self setTitle:[selectedViewController title]];
    [super setSelectedViewController:selectedViewController];
    if( selectedViewController == [[self childViewControllers] objectAtIndex:3])
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"] animated:TRUE];
}




@end
