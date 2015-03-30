//
//  BookFileManager.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/26.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookFileManager : NSObject
- (NSString *)getBookRootDirectory;
- (NSString *)getBookFullPath:(NSString *)filename;
- (BOOL)isBookExist:(NSString *)filename;
- (NSString *)getFileContent:(NSString *)filename;
@end
