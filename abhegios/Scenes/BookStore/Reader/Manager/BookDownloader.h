//
//  BookDownloader.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/26.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BookDownloaderDelegate <NSObject>
- (void)bookDownloadFinished:(BOOL)success FileName:(NSString *)filename;
@end

@interface BookDownloader : NSObject<NSURLConnectionDataDelegate>
@property (nonatomic, assign) id <BookDownloaderDelegate> delegate;
- (void)downloadBookFromURL:(NSString *)url FileName:(NSString *)filename;
@end
