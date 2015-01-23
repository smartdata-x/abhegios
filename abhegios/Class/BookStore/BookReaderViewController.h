//
//  BookReaderViewController.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookChapterInfo : OEZBaseEntity

@end

@interface BookReaderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *readerView;
@property (weak, nonatomic) IBOutlet UILabel *chapterView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *progressView;
@property (weak, nonatomic) IBOutlet UILabel *assistView;
@end
