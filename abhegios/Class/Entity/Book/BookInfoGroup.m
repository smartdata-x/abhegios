//
//  BookInfoGroup.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookInfoGroup.h"
#import "BookInfo.h"

@implementation BookInfoGroup

- (void)setBookInfosDictionarys:(NSArray *)arrays {
    
    _bookInfos = [BookInfo initWithsDictionarys:arrays];
}

@end
