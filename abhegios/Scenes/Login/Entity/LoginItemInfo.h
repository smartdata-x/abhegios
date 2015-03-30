//
//  LoginItemInfo.h
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "ILogin.h"
#import <OEZCommSDK/OEZBaseEntity.h>
@interface LoginItemInfo : OEZBaseEntity
@property LoginType type;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *icon;
@end
