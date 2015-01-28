//
//  BookApi.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReqeustDelegate.h"
@protocol BookAPI <NSObject>
- (void)getBookStoreHome:(id<ReqeustDelegate>) delegate;
@end
