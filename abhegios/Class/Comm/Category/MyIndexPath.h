//
//  MyIndexPath.h
//  abhegios
//
//  Created by 180 on 15/1/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyIndexPath : NSIndexPath
+ (MyIndexPath *)indexPathForRow:(NSInteger)row insection1:(NSInteger)section1 inSection:(NSInteger)section;
@property(nonatomic,readonly) NSInteger section;
@property(nonatomic,readonly) NSInteger row;
@property(nonatomic,readonly) NSInteger section1;
@end
