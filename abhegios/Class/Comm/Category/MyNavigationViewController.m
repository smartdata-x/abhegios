//
//  MyNavigationViewController.m
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MyNavigationViewController.h"
#import "AppDetailsViewController.h"
#import "BookDetailInfoTableViewController.h"
@implementation MyNavigationViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [self.navigationBar setBarTintColor:kUIColorWithRGB(0x339ee2)];
    NSDictionary* titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]/*,
                                                                                              NSShadowAttributeName: [UIColor whiteColor]*/};
    [[UINavigationBar appearance] setTitleTextAttributes: titleTextAttributes];

}


-(void) pushAppDetailsViewController:(id) appInfo animated:(BOOL)animated
{
    [self pushViewControllerWithIdentifier:@"AppDetailsViewController" completion:^(UIViewController *viewController) {
        [(AppDetailsViewController*)viewController setAppInfo:(AppInfo*)appInfo];
    } animated:YES];
}

-(void) pushBookDetailsViewController:(id) bookInfo animated:(BOOL)animated
{

    [self pushViewControllerWithIdentifier:@"BookDetailInfoTableViewController" completion:^(UIViewController *viewController) {
        [(BookDetailInfoTableViewController*)viewController setData:bookInfo];
    } animated:YES];
}
@end
