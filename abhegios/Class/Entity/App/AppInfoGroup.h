//
//  AppGroup.h
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//
#import <OEZCommSDK/OEZBaseEntity.h>
@interface AppInfoGroup : OEZBaseEntity
@property NSInteger             style;
@property(nonatomic, copy)      NSString *title;
@property(nonatomic, copy)      NSString *key;
@property (nonatomic,retain)    NSArray  *appInfos;
-(void) setAppInfosDictionarys:(NSArray *)array;
@end
