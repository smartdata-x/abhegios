//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelperProtocol.h"

@protocol HandleOpenURLDelegate<NSObject>
- (BOOL) handleOpenURL:(NSURL *)url ;
- (NSString*) getKey;
@end
@interface HandleOpenURLHelper : NSObject<HelperProtocol>
-(BOOL) handleOpenURL:(NSURL *)url ;
- (void) addHandleDelegate:(id<HandleOpenURLDelegate>) handle;
- (void) removeHandleDelegate:(id<HandleOpenURLDelegate>) handle;
@end