//
//  MyNavigationViewController.h
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UINavigationController (MyNavigationViewController)
-(void) pushAppDetailsViewController:(id) appInfo animated:(BOOL)animated;
-(void) pushBookDetailsViewController:(id) bookInfo animated:(BOOL)animated;
-(void) pushMoiveDetailsViewController:(id) movieInfo animated:(BOOL)animated;
@end
@interface MyNavigationViewController : OEZNavigationViewController

@end
