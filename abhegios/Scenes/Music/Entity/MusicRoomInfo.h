//
//  MusicInfo.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/3.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OEZCommSDK/OEZCommSDK.h>
#import "BaseInfo.h"
@interface MusicRoomInfo : OEZBaseEntity
@property NSUInteger id;
@property(nonatomic, retain) NSString *name;
@property (nonatomic, copy) NSString *ablum;
@property (nonatomic, copy) NSString *artist;
@property (nonatomic, copy) NSString *hq_url;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, retain) NSString *pic;
@property CGFloat duration;
@property NSInteger like;
@end
