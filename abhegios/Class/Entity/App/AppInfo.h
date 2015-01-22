//
//  AppInfo.h
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//
#import <OEZCommSDK/OEZBaseEntity.h>

@interface AppInfo : OEZBaseEntity
@property NSUInteger id;
@property NSUInteger type;
@property NSUInteger order;
@property NSUInteger down;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *logo;
@property(nonatomic, copy) NSString *summary;
@end
