//
//  BookDetailInfoTableViewController.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, BookDetailInfoSection) {
    BookDetailInfoSectionHeaderCell = 0,
    BookDetailInfoSectionReadSave,
    BookDetailInfoSectionIntroduction,
    BookDetailInfoSectionChapterInfo,
    BookDetailInfoSectionTagInfo,
    BookDetailInfoSectionReadDownload,
    BookDetailInfoSectionMAX,
};
@interface BookDetailInfoTableViewController : UITableViewController

@end
