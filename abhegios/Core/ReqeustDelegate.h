//
//  ReqeustDelegate.h
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

@protocol ReqeustDelegate <NSObject>
-(void) reqeust:(id)reqeust didComplete:(id) data ;
-(void) reqeust:(id)reqeust didError:(NSError*) err;
@end

@protocol ReqeustCacheDelegate <NSObject>
-(void) didCache:(id) data ;
@end