//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OEZCommSDK/OEZBaseEntity.h>

@interface ThirdLoginInfo : OEZBaseEntity
@property NSInteger source;
@property NSInteger machine;
@property NSInteger imei;
@property double    latitude;
@property double    longitude;

@property(nonatomic, retain) NSString *nickname;
@property(nonatomic, retain) NSString *session;
@property(nonatomic, retain) NSString *sex;
@property(nonatomic, retain) NSString *birthday;
@property(nonatomic, retain) NSString *location;
@property(nonatomic, retain) NSString *head;
@end