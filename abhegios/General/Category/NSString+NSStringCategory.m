//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "NSString+NSStringCategory.h"


@implementation NSString (NSStringCategory)

-(BOOL) isEmpty
{
    return [NSString isEmpty:self];
}
-(BOOL) isNotEmpty
{
    return [NSString isNotEmpty:self];
}

+(BOOL) isNotEmpty:(NSString*) str
{
    return ![NSString isEmpty:str];
}
+(BOOL) isEmpty:(NSString*) string
{
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

@end