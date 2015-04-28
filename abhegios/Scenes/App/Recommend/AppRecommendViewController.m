//
//  AppRecommendViewController.m
//  abhegios
//
//  Created by yaobanglin on 15/4/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppRecommendViewController.h"
#import "AppAPIHelper.h"
@interface AppRecommendViewController ()

@end

@implementation AppRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) didRequest
{
    [[[AppAPIHelper shared] getApplyAPI] getAppPersonal:self];
}


@end
