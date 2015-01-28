//
//  BaseInfoAdapter.m
//  abhegios
//
//  Created by 180 on 15/1/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BaseInfoAdapter.h"
#import "BaseInfo.h"
#import "AppInfo.h"
#import "BookInfo.h"
#import "MusicInfo.h"
@implementation BaseInfoAdapter
+(NSString*) getPic:(id) info
{
    if ( [info respondsToSelector:@selector(logo)]) {
        return [info logo];
    }
    else if ( [info respondsToSelector:@selector(pic)]) {
        return [info pic];
    }
    return nil;
}

+(NSString*) getButtonText:(id) info
{
    if( [info isKindOfClass:[AppInfo class]])
        return @"下载";
    else if( [info isKindOfClass:[BookInfo class]])
        return @"阅读";
    else if( [info isKindOfClass:[MusicInfo class]])
        return @"试听";
    else if( [info isKindOfClass:[MusicInfo class]])
        return @"观看";
    return @"下载";
}

+(NSString*) getPopularity:(id) info
{
    if( [info isKindOfClass:[AppInfo class]])
        return [NSString stringWithFormat:@"下载次数 %@",@([info down])];
    else if( [info isKindOfClass:[BookInfo class]])
        return [NSString stringWithFormat:@"阅读次数 %@",@([info read])];
    else if( [info isKindOfClass:[MusicInfo class]])
        return [NSString stringWithFormat:@"试听次数 %@",@([info down])];
    else if( [info isKindOfClass:[MusicInfo class]])
        return [NSString stringWithFormat:@"观看次数 %@",@([info listen])];
    return @"";
}

@end
