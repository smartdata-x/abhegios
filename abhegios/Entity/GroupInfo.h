//
//  GroupInfo.h
//  abhegios
//
//  Created by 180 on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>
@interface GroupInfo : OEZBaseEntity
@property                           NSInteger   style;
@property(nonatomic, retain)      NSString      *title;
@property(nonatomic, retain)      NSString      *key;
@property(nonatomic, retain)      NSString      *entityClassName;
@property(nonatomic,retain)      NSArray       *entitys;
//entityClass 继承 OEZBaseEntity的类
-(void) setEntitysDictionarys:(NSArray *)array entityClass:(Class) entityClass;


//entityClass 继承 OEZBaseEntity的类
+(NSArray*) initWithsConfigAndDataDictionarys:(NSString*) configName groupsData:(NSDictionary*) groupsData entityClass:(Class) entityClass;
//entityClass 继承 OEZBaseEntity的类
+(NSArray*) initWithsConfigAndDataJsonFile:(NSString*) configName jsonName:(NSString*) jsonName entityClass:(Class) entityClass;
//由configName 对应组的entityClassName解析entitys数据
+(NSArray*) initWithsConfigAndDataDictionarys:(NSString*) configName groupsData:(NSDictionary*) groupsData;
//由configName 对应组的entityClassName解析entitys数据
+(NSArray*) initWithsConfigAndDataJsonFile:(NSString*) configName jsonName:(NSString*) jsonName;

@end
