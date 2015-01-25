//
//  BookStoreViewController.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookStoreTableViewCellStyle3.h"

typedef NS_ENUM(NSInteger, BookStoreTableViewCellStyle) {
    
    BookStoreTableViewCellStyleNone = 0,
    BookStoreTableViewCellStyleOne,
    BookStoreTableViewCellStyleTwo,
    BookStoreTableViewCellStyleThree,
    BookStoreTableViewCellStyleFour,
};

@interface BookStoreViewController : UITableViewController<BookStoreTableViewCellStyle3Delegate>

@end
