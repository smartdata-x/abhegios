//
//  OhterAPI.h
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "ReqeustDelegate.h"
@protocol OtherAPI <NSObject>
-(void) getRecommendHome:(id<ReqeustDelegate>) delegate;
@end
