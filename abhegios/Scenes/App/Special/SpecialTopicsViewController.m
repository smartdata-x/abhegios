//
//  SpecialTopicsViewControllerTableViewController.m
//  abhegios
//
//  Created by 180 on 15/2/5.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "SpecialTopicsViewController.h"
#import "AppAPIHelper.h"
@interface SpecialTopicsViewController ()

@end

@implementation SpecialTopicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void) didRequest
{
    [[[AppAPIHelper shared] getApplyAPI] getSpecialTopics:[_adInfo id] delegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
