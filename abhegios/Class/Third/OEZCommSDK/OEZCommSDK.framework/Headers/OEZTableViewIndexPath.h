//
//  OEZTableViewIndexPath.h
//  OEZCommSDK
//
//  Created by 180 on 15/1/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OEZTableViewIndexPath : NSIndexPath
+ (OEZTableViewIndexPath *)indexPathForRowColumn:(NSInteger)row inColumn:(NSInteger)column inSection:(NSInteger)section;
+ (OEZTableViewIndexPath *)indexPathForRowAction:(NSInteger)row inAction:(NSInteger)action inSection:(NSInteger)section;
+ (OEZTableViewIndexPath *)indexPathForRowColumnAction:(NSInteger)row inColumn:(NSInteger)column inAction:(NSInteger)action inSection:(NSInteger)section;
@property(nonatomic,readonly) NSInteger section;
@property(nonatomic,readonly) NSInteger row;
@property(nonatomic,readonly) NSInteger column;
@property(nonatomic,readonly) NSInteger action;
@end
