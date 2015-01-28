//
//  MyIndexPath.m
//  abhegios
//
//  Created by 180 on 15/1/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MyIndexPath.h"

@implementation MyIndexPath

+ (MyIndexPath *)indexPathForRow:(NSInteger)row insection1:(NSInteger)section1 inSection:(NSInteger)section
{
    NSUInteger values[] = {row,section1,section};
    MyIndexPath* indexPath = [MyIndexPath indexPathWithIndexes:values length:3];
    return indexPath;
}

-(NSInteger) row
{
    return [self indexAtPosition:0];
}
-(NSInteger) section1
{
    return [self indexAtPosition:1];
}
-(NSInteger) section
{
    return [self indexAtPosition:2];
}

@end
