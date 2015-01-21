//
//  BookInfoGroup.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookInfoGroup : OEZBaseEntity
@property NSInteger style;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, retain) NSArray *bookInfos;
- (void)setBookInfosDictionarys:(NSArray *)arrays;
@end
