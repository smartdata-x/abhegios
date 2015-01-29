//
//  BookReaderViewController.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReqeustDelegate.h"
#import "BookDownloader.h"

typedef NS_ENUM(NSInteger, BookReaderType) {
    BookReaderTypeChapterList = 6,
};

@interface BookReaderViewController : UIViewController<UIGestureRecognizerDelegate, BookDownloaderDelegate, ReqeustDelegate>
@property (weak, nonatomic) IBOutlet UITextView *readerView;
@property (weak, nonatomic) IBOutlet UILabel *chapterView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *progressView;
@property (weak, nonatomic) IBOutlet UILabel *assistView;
- (void)doTap:(UIGestureRecognizer *)gesture;
- (void)doNext:(UIGestureRecognizer *)gesture;
- (void)doPrev:(UIGestureRecognizer *)gesture;
- (void)setData:(id)data;
- (void)setDataWithUrl:(id)data URL:(NSString *)url;
@end
