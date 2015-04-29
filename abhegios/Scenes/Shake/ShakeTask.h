//
//  ShakeTask.h
//  abhegios
//
//  Created by yaobanglin on 15/4/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReqeustDelegate.h"

typedef NS_ENUM(NSInteger, ShakeTaskType) {
    ShakeTaskNoneType = 0,
    ShakeTaskAppType ,
    ShakeTaskBeaconType ,
    ShakeTaskWIFIType ,
};

@protocol  ShakeTaskDelegate;
@interface ShakeTask : NSObject<ReqeustDelegate>
@property(nonatomic,assign) id<ShakeTaskDelegate>     delegate;
-(void) startReqeust;
-(void) didSelect:(UIViewController*) viewController;
+(ShakeTask*) shakeTaskFactory:(ShakeTaskType) type;
@end



@protocol ShakeTaskDelegate <NSObject>

-(void) shakeTask:(ShakeTask*) shakeTask didComplete:(id) data view:(UIView*) view;
-(void) shakeTask:(ShakeTask*) shakeTask didError:(NSError*) error;
@end

