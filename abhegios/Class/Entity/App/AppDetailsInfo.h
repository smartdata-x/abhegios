//
//  AppDetailsInfo.h
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppInfo.h"
@interface AppDetailsInfo : AppInfo
@property double size;
@property double star;
@property NSInteger lang;
@property (nonatomic,retain)    NSArray     *pic;
@property (nonatomic,copy)      NSString    *version;
@property (nonatomic,copy)      NSString    *ontime;
@property (nonatomic,copy)      NSString    *provide;
@end

@interface AppDetailsPage : OEZBaseEntity
@property (nonatomic,retain) AppDetailsInfo *intro;
@property (nonatomic,retain)    NSArray     *like;
@end
