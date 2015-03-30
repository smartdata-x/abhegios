//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "HandleOpenURLHelper.h"


@implementation HandleOpenURLHelper {
    NSMutableArray *_handles;
}



HELPER_SHARED

- (instancetype)init {
    self = [super init];
    if (self) {
        _handles = [[NSMutableArray alloc] init];
    }

    return self;
}


- (BOOL) handleOpenURL:(NSURL *)url
{
    for (id<HandleOpenURLDelegate> handle in _handles) {
        if ( [handle respondsToSelector:@selector(getKey)]
                && [handle respondsToSelector:@selector(handleOpenURL:)]
                && [[url absoluteString] hasPrefix:[handle getKey]]
                )
        {

            return [handle handleOpenURL:url];
        }
    };
    return NO;
}

- (void) addHandleDelegate:(id<HandleOpenURLDelegate>) handle
{
    [_handles addObject:handle];
}
- (void) removeHandleDelegate:(id<HandleOpenURLDelegate>) handle
{
    [_handles removeObject:handle];
}
@end