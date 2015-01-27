//
//  AppAPIDelegate.h
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AppNetAPIDelegate <NSObject>
-(void) didComplete:(id) data ;
-(void) didError:(NSError*) err;
@end

@protocol AppCacheAPIDelegate <NSObject>
-(void) didCache:(id) data ;
@end

@protocol AppNetAndCacheAPIDelegate<AppNetAPIDelegate,AppCacheAPIDelegate>
@end

