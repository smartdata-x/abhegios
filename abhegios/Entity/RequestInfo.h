//
//  RequestInfo.h
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <OEZCommSDK/OEZCommSDK.h>

@interface RequestInfo : OEZBaseEntity
@property NSInteger uid;
@property CGFloat   latitude;
@property CGFloat   longitude;
@property(nonatomic, retain) NSString *token;
@end
