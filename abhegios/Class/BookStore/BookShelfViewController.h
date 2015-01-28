//
//  BookShelfViewController.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReqeustDelegate.h"
typedef NS_ENUM(NSInteger, BookShelfType) {
    BookShelfTypeList = 6,
};
@interface BookShelfViewController : UIViewController<ReqeustDelegate>
@end
