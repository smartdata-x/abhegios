//
//  BookSearchResultTableViewController.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, BookSearchResultSection) {
    BookSearchResultSectionHeader = 0,
    BookSearchResultSectionBooks,
    BookSearchResultSectionMAX,
};
@interface BookSearchResultTableViewController : UITableViewController
- (void)setData:(id)data;
@end
