//
//  GameHomeInfo.m
//  abhegios
//
//  Created by 180 on 15/1/26.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "GameHomeInfo.h"
#import "GroupInfo.h"
@implementation GameHomeInfo

-(id) initWithDictionary:(NSDictionary *)dict
{
    self = [self init];
    if( self != nil)
    {
        _find =[AppDetailsInfo initWithDictionary:[dict objectForKey:@"find"]];
        _groups = [GroupInfo  initWithsConfigAndDataDictionarys:@"gamehomeinfo" groupsData:dict entityClass:[AppInfo class]];
    }
    return self;
}
@end
