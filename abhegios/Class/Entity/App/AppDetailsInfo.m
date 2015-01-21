//
//  AppDetailsInfo.m
//  abhegios
//
//  Created by 180 on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppDetailsInfo.h"

@implementation AppDetailsInfo
@end



@implementation AppDetailsPage
-(instancetype) initWithDictionary:(NSDictionary *) dict
{
    self = [self init];
    if (self != nil) {
        _intro = [[AppDetailsInfo alloc] initWithDictionary:[dict objectForKey:@"intro"]];
        _like  = [AppInfo initWithsDictionarys:[dict objectForKey:@"like"]];
    }
    return self;
}
@end
