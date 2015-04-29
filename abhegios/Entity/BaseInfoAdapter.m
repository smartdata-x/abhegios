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
#import "MovieInfo.h"
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
    switch ([BaseInfoAdapter getEntityType:info])
    {
        case EntityType_App:
            return @"下载";
        case EntityType_Book:
            return @"阅读";
        case EntityType_Music:
            return @"试听";
        case EntityType_Movie:
            return @"观看";
        default:
             return @"下载";
    }
}

+(NSString*) getPopularity:(id) info
{
    switch ([BaseInfoAdapter getEntityType:info]) {
        case EntityType_App:
             return [NSString stringWithFormat:@"下载次数 %@",@([info down])];
        case EntityType_Book:
            return [NSString stringWithFormat:@"阅读次数 %@",@([info read])];
        case EntityType_Music:
            return [NSString stringWithFormat:@"点赞次数 %@",@([info like])];
        case EntityType_Movie:
            return [NSString stringWithFormat:@"观看次数 %@",@([info play])];
        default:
            return @"";
    }
}

+(EntityType) getEntityType:(id) info
{
    if( [info isKindOfClass:[AppInfo class]])
        return EntityType_App;
    else if( [info isKindOfClass:[BookInfo class]])
        return EntityType_Book;
    else if( [info isKindOfClass:[MusicInfo class]])
        return EntityType_Music;
    else if( [info isKindOfClass:[MovieInfo class]])
        return EntityType_Movie;
    return EntityType_None;
}

@end
