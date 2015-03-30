//
//  GroupInfo.m
//  abhegios
//
//  Created by 180 on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "GroupInfo.h"

@implementation GroupInfo

-(void) setEntitysDictionarys:(NSArray *)array entityClass:(Class) entityClass
{
    if( [entityClass isSubclassOfClass:[OEZBaseEntity class]] )
        _entitys = [entityClass initWithsDictionarys:array];
}

+(NSArray*) initWithsConfigAndDataDictionarys:(NSString*) configName groupsData:(NSDictionary*) groupsData entityClass:(Class) entityClass
{
    NSArray*  array = [GroupInfo initWithsPlistResource:configName  ofType:@"plist"];
    for (GroupInfo *group in array)
    {
       
        if(  [group entityClassName] != nil )
        {
                [group setEntitysDictionarys:[groupsData objectForKey:[group key]] entityClass:[NSClassFromString([group entityClassName]) class]];
        }
        else
        {
            [group setEntityClassName:NSStringFromClass(entityClass)];
            [group setEntitysDictionarys:[groupsData objectForKey:[group key]] entityClass:entityClass];
        }
    }
    return array;
}

+(NSArray*) initWithsConfigAndDataJsonFile:(NSString*) configName jsonName:(NSString*) jsonName entityClass:(Class) entityClass
{
    NSDictionary *groupsData = nil;
    NSString   *jsonPath  = [[NSBundle mainBundle] pathForResource:jsonName ofType:@"json"];
    if( jsonPath != nil)
    {
        NSData *data = [NSData dataWithContentsOfFile:jsonPath];
        if( data != nil)
        {
            NSError *error = nil;
            id json =[NSJSONSerialization JSONObjectWithData:data
                                                     options:NSJSONReadingAllowFragments
                                                       error:&error];
            if( error == nil && [json isKindOfClass:[NSDictionary class]] )
            {
                groupsData = json;
            }
        }
    }
    return [self initWithsConfigAndDataDictionarys:configName groupsData:groupsData entityClass:entityClass];
}

+(NSArray*) initWithsConfigAndDataDictionarys:(NSString*) configName groupsData:(NSDictionary*) groupsData
{
    return [self initWithsConfigAndDataDictionarys:configName groupsData:groupsData entityClass:nil];
}

+(NSArray*) initWithsConfigAndDataJsonFile:(NSString*) configName jsonName:(NSString*) jsonName
{
    return [self initWithsConfigAndDataJsonFile:configName jsonName:jsonName entityClass:nil];
}
@end
