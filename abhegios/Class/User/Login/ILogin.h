//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "ThirdLoginInfo.h"
#import "HandleOpenURLHelper.h"
#import "ReqeustDelegate.h"
#define LOGIN_ERROR @"登录失败！"
#define NOT_NETWORK @"无网络连接，请设置网络!"
typedef NS_ENUM(NSInteger, LoginType) {
    LoginTypeNone = 0,
    LoginTypeWeibo ,
    LoginTypeWX ,
    LoginTypeQQ ,
    LoginTypePhone ,
    LoginTypeGuest
};

@class ILogin;
@class UserInfo;

@protocol LoginDelegate<NSObject>
-(void) didLoginStart;
-(void) didLoginOk:(UserInfo*) user;
-(void) didLoginError:(NSError*) err;

@end

@interface ILogin : NSObject
@property (nonatomic, assign)   id<LoginDelegate> delegate;
-(void) login;
-(void) didStart;
-(void) didOk:(UserInfo*) user;
-(void) didError:(NSError*) err;
-(void) didStrError:(NSString*) err;
@end

@interface IThirdLogin : ILogin<HandleOpenURLDelegate,ReqeustDelegate>
{
@protected
    ThirdLoginInfo*   _loginInfo;
}
-(id) init:(LoginType) source;
-(void) login;
@end