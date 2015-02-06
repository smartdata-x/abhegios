//
//  BaseInfoAdapter.h
//  abhegios
//
//  Created by 180 on 15/1/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, EntityType) {
    EntityType_None = 0,
    EntityType_App = 1,
    EntityType_Ad,
    EntityType_Book ,
    EntityType_Music,
    EntityType_Movie
};
@interface BaseInfoAdapter : NSObject
+(NSString*) getPic:(id) info;
+(NSString*) getButtonText:(id) info;
+(NSString*) getPopularity:(id) info;
+(EntityType) getEntityType:(id) info;
@end
