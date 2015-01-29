//
//  BookDownloader.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/26.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDownloader.h"
#import "BookFileManager.h"

@interface BookDownloader()
@property (nonatomic, retain) NSMutableData *fileData;
@property (nonatomic, retain) NSFileHandle *writeHandle;
@property (nonatomic, assign) long long curLength;
@property (nonatomic, assign) long long sumLength;
@property (nonatomic, assign) BOOL isDownloading;
@property (nonatomic, retain) NSURLConnection *cnnt;
@property (nonatomic, copy) NSString *fileName;
@end

@implementation BookDownloader

- (void)downloadBookFromURL:(NSString *)url FileName:(NSString *)filename {
    BookFileManager *fileMgr = [[BookFileManager alloc] init];
    if (self.isDownloading) {
        return;
    }
    NSURL *urlAdd = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlAdd];
    self.cnnt = [NSURLConnection connectionWithRequest:request delegate:self];
    self.fileName = [fileMgr getBookFullPath:filename];
    self.isDownloading = YES;
}

// NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    if (self.sumLength) {
        return;
    }
    
    // 创建一个空的文件
    NSFileManager *mgr = [NSFileManager defaultManager];
    [mgr createFileAtPath:self.fileName contents:nil attributes:nil];
    // 创建文件句柄
    self.writeHandle = [NSFileHandle fileHandleForWritingAtPath:self.fileName];
    self.sumLength = response.expectedContentLength;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    self.curLength += data.length;
    // 进度
    double progress = (double)self.curLength / self.sumLength;
    NSLog(@"当前下载进度: %f", progress);
    
    [self.writeHandle seekToEndOfFile];
    [self.writeHandle writeData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // 下载完成
    [self.writeHandle closeFile];
    self.writeHandle = nil;
    self.curLength = 0;
    self.sumLength = 0;
    self.isDownloading = NO;
    
    if ([_delegate respondsToSelector:@selector(bookDownloadFinished:FileName:)]) {
        [_delegate bookDownloadFinished:YES FileName:self.fileName];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if ([_delegate respondsToSelector:@selector(bookDownloadFinished:FileName:)]) {
        [_delegate bookDownloadFinished:NO FileName:nil];
    }
}

@end
