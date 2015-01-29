//
//  OEZTableViewIndexPath.h
//  OEZCommSDK
//
//  Created by 180 on 15/1/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OEZTableViewIndexPath : NSIndexPath
+ (OEZTableViewIndexPath *)indexPathForRowColumn:(NSUInteger)row inColumn:(NSUInteger)column inSection:(NSUInteger)section;
+ (OEZTableViewIndexPath *)indexPathForRowAction:(NSUInteger)row inAction:(NSUInteger)action inSection:(NSUInteger)section;
+ (OEZTableViewIndexPath *)indexPathForRowColumnAction:(NSUInteger)row inColumn:(NSUInteger)column inAction:(NSUInteger)action inSection:(NSUInteger)section;
@property(nonatomic,readonly) NSUInteger section;
@property(nonatomic,readonly) NSUInteger row;
@property(nonatomic,readonly) NSUInteger column;
@property(nonatomic,readonly) NSUInteger action;
@end
