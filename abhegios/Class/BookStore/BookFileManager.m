//
//  BookFileManager.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/26.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookFileManager.h"

@implementation BookFileManager

- (NSString *)getBookRootDirectory {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *bookPath = [documentPath stringByAppendingPathComponent:@"books"];
    if (![fm fileExistsAtPath:bookPath isDirectory:NULL]) {
        [fm createDirectoryAtPath:bookPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return bookPath;
}

- (NSString *)getBookFullPath:(NSString *)filename {
    NSString *bookPath = [self getBookRootDirectory];
    NSString *filePath = [bookPath stringByAppendingPathComponent:filename];
    return filePath;
}

- (BOOL)isBookExist:(NSString *)filename {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *filePath = [self getBookFullPath:filename];
    if ([fm fileExistsAtPath:filePath isDirectory:NULL]) {
        return YES;
    }
    return NO;
}

- (NSString *)getFileContent:(NSString *)filename {
    unsigned long encode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8);
    NSData *strdata = [NSData dataWithContentsOfFile:filename];
    NSString *curContent = [[NSString alloc] initWithData:strdata encoding:encode];
    
    // 没有得到内容，采用其他编码
    if (curContent == nil) {
        encode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        curContent = [[NSString alloc] initWithData:strdata encoding:encode];
    }
    
    if (curContent == nil) {
        encode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_2312_80);
        curContent = [[NSString alloc] initWithData:strdata encoding:encode];
    }
    
    if (curContent == nil) {
        encode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGBK_95);
        curContent = [[NSString alloc] initWithData:strdata encoding:encode];
    }
    return curContent;
}

@end
