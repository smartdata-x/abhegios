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

@end
