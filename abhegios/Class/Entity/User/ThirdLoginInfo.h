//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEntity.h"


@interface ThirdLoginInfo : BaseEntity
@property NSInteger source;
@property NSInteger machine;
@property NSInteger imei;
@property double    latitude;
@property double    longitude;

@property(nonatomic, copy) NSString *nickname;
@property(nonatomic, copy) NSString *session;
@property(nonatomic, copy) NSString *sex;
@property(nonatomic, copy) NSString *birthday;
@property(nonatomic, copy) NSString *location;
@property(nonatomic, copy) NSString *head;
@end