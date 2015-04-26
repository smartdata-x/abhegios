//
//  AppDetailsViewControllerTableViewController.h
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshTableViewController.h"
@class AppInfo;
@interface AppDetailsViewController : RefreshTableViewController
@property AppInfo  *data;
@end
