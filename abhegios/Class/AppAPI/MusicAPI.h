//
//  MusicAPI.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/3.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReqeustDelegate.h"
@protocol MusicAPI <NSObject>
- (void)getMusicDimension:(id<ReqeustDelegate>) delegate Dimension:(NSString *)dimension Sid:(NSInteger)sid;
@end
