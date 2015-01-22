//
//  BookStoreHome.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookStoreHome.h"
#import "BookInfo.h"
#import "BookInfoGroup.h"

@implementation BookStoreHome

- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        static NSArray *g_array = nil;
        if (g_array == nil) {
            g_array =  [BookInfoGroup initWithsPlistResource:@"bookstorehome"  ofType:@"plist"];
        }
        for (BookInfoGroup *group in g_array) {
            [group setBookInfosDictionarys:[dict objectForKey:[group key]]];
        }
        _bookInfoGroups = g_array;
    }
    return self;
}

@end
