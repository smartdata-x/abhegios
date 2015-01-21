//
//  OEZNavigationViewController.h
//  OEZCommSDK
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (OEZNavigationControllerCategory)
-(void) pushViewControllerWithIdentifier:(NSString *)identifier  animated:(BOOL)animated;
@end

@interface OEZNavigationViewController : UINavigationController
-(void) pushViewControllerWithIdentifier:(NSString *)identifier  animated:(BOOL)animated;
@end
