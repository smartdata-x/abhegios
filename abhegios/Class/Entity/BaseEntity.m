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
@end