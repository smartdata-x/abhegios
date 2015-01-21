//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "BaseEntity.h"
#import <objc/runtime.h>

@implementation BaseEntity {

}

-(id) init:(NSDictionary*) json
{
    self = [super init];
    if( self != nil)
        [self dictionaryToObj:json];
    return self;
}

-(void) dictionaryToObj:(NSDictionary *) json
{
    if( json != nil )
    {
        unsigned int propsCount = 0;
        objc_property_t *props = class_copyPropertyList([self class], &propsCount);
        for(int i = 0;i < propsCount; i++)
        {
            objc_property_t prop = props[i];
            NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
            id value = [json objectForKey:propName];
            if( value != nil &&  value != [NSNull null] && ![value isKindOfClass:[NSDictionary class]])
                [self setValue:value forKey:propName];
        }
    }
}

+(NSArray*) initWithsDictionarys:(NSArray*) dics
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in dics) {
        [array addObject:[[[self class] alloc] init:dic]];
    }
    return array;
}
+(NSArray*) initWithsContentsOfPlistFile:(NSString *)path
{
    return [self initWithsDictionarys:[[NSMutableArray alloc] initWithContentsOfFile:path]];
}

+(NSArray*) initWithsPlistResource:(NSString *)name ofType:(NSString *)ext
{
    NSString   *plistPath  = [[NSBundle mainBundle] pathForResource:name ofType:ext];
    return [self initWithsContentsOfPlistFile:plistPath];
}

+(NSArray*) initWithsJsonResource:(NSString *)name ofType:(NSString *)ext
{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:ext];
    if( path != nil)
    {
        NSData *data = [NSData dataWithContentsOfFile:path];
        if( data != nil)
        {
            NSError *error = nil;
            id json =[NSJSONSerialization JSONObjectWithData:data
                                                     options:NSJSONReadingAllowFragments
                                                       error:&error];
            if( error == nil && [json isKindOfClass:[NSArray class]] )
            {
                return [self initWithsDictionarys:json];
            }
        }
    }
    return nil;
}
@end