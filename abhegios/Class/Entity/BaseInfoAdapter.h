//
//  BaseInfoAdapter.h
//  abhegios
//
//  Created by 180 on 15/1/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseInfoAdapter : NSObject
+(NSString*) getPic:(id) info;
+(NSString*) getButtonText:(id) info;
+(NSString*) getPopularity:(id) info;
@end
