//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "ThirdLoginInfo.h"
#import "HandleOpenURLHelper.h"

#define LOGIN_ERROR @"登录失败！"
#define NOT_NETWORK @"无网络连接，请设置网络!"
typedef NS_ENUM(NSInteger, Login_Source) {
    WeiboLogin_Source = 1,
    WXLogin_Source = 2,
    QQLogin_Source  = 3,
};

@class ILogin;
@class User;

@protocol LoginDelegate<NSObject>
-(void) didLoginStart;
-(void) didLoginOk:(User*) user;
-(void) didLoginError:(NSError*) err;

@end

@interface ILogin : NSObject
@property (nonatomic, assign)   id<LoginDelegate> delegate;
-(void) login;
-(void) didStart;
-(void) didOk:(User*) user;
-(void) didError:(NSError*) err;
-(void) didStrError:(NSString*) err;
@end

@interface IThirdLogin : ILogin<HandleOpenURLDelegate>
{
@protected
    ThirdLoginInfo*   _loginInfo;
}
-(id) init:(Login_Source) source;
-(void) login;
@end