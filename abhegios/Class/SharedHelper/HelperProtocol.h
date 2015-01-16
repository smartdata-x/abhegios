//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#define HELPER_SHARED +(instancetype)shared{ \
                             static id sharedHelper = nil;\
                             static dispatch_once_t predicate;\
                            dispatch_once(&predicate, ^{\
                                sharedHelper = [[self alloc] init];\
                                });\
                                return sharedHelper;}
@protocol HelperProtocol <NSObject>
+(instancetype)shared;
@end