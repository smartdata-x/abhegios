//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OEZCommSDK/OEZBaseEntity.h>

@interface UserInfo : OEZBaseEntity
@property NSInteger uid;
@property NSInteger source;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *nickname;
@property (nonatomic, retain) NSString *token;
@property (nonatomic, retain) NSString *head;
@end