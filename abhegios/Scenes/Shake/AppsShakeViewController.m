//
//  AppsShakeViewController.m
//  abhegios
//
//  Created by yaobanglin on 15/4/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppsShakeViewController.h"

@interface AppsShakeViewController ()

@end

@implementation AppsShakeViewController

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
    [self reqeust:nil didComplete:_tableViewData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) setData:(id) data
{
    _tableViewData  = data;
}
@end
