//
//  FoundItemInfo.h
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//
#import <OEZCommSDK/OEZCommSDK.h>
@interface FoundItemInfo : OEZBaseEntity
@property(nonatomic, copy) NSString *identifier;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *icon;
@end
