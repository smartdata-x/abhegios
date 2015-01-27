//
//  BaseInfo.h
//  abhegios
//
//  Created by 180 on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <OEZCommSDK/OEZCommSDK.h>

#define mainScreenFrame [[UIScreen mainScreen] bounds]
#define mainScreenWidth mainScreenFrame.size.width
#define mainScreenHeight mainScreenFrame.size.height

@interface BaseInfo : OEZBaseEntity
@property NSUInteger id;
@property NSUInteger type;
@end

@interface BaseInfoMoreONS : BaseInfo

@property NSUInteger order;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *summary;
@end

@interface BaseInfoMoreONSP : BaseInfoMoreONS
@property (nonatomic, retain) NSString *pic;
@end

