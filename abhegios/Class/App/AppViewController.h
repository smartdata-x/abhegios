//
//  AppViewController.h
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AppTableViewCellStyle) {
    AppTableViewCellStyleNone = 0,
    AppTableViewCellStyleOne,
    AppTableViewCellStyleTwo ,
    AppTableViewCellStyleThree ,
    AppTableViewCellStyleFour
};
@interface AppViewController : UITableViewController

@end
