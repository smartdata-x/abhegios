//
//  BookSearchResultTableViewController.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshTableViewController.h"
typedef NS_ENUM(NSInteger, BookSearchResultSection) {
    BookSearchResultSectionHeader = 0,
    BookSearchResultSectionBooks,
    BookSearchResultSectionMAX,
};
typedef NS_ENUM(NSInteger, BookSearchResultType) {
    BookSearchResultTypeHot = 2,
    BookSearchResultTypeNew = 5,
    BookSearchResultTypeApiHot = 1,
    BookSearchResultTypeApiNew = 2,
};
@interface BookSearchResultTableViewController : RefreshTableViewController
- (void)setData:(id)data;
@end
