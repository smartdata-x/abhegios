//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "QQLogin.h"
#import "TencentOAuth.h"
#import "NSString+NSStringCategory.h"

@interface QQLogin()<TencentSessionDelegate>
@end

@implementation QQLogin {
    TencentOAuth* _tencentOAuth;
    NSMutableArray* _permissions;
}


-(BOOL) handleOpenURL:(NSURL *)url
{
    return [TencentOAuth HandleOpenURL:url];
}

-(NSString*) getKey
{
    return [NSString stringWithFormat:@"tencent%@",kQQAppID];
}

- (id)init:(Login_Source)source {
    self = [super init:source];
    if (self) {
        _tencentOAuth = [[TencentOAuth alloc] initWithAppId:kQQAppID
                                                andDelegate:self];

        _permissions = [NSMutableArray arrayWithObjects:
                kOPEN_PERMISSION_GET_USER_INFO,
                kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                kOPEN_PERMISSION_ADD_ALBUM,
                kOPEN_PERMISSION_ADD_IDOL,
                kOPEN_PERMISSION_ADD_ONE_BLOG,
                kOPEN_PERMISSION_ADD_PIC_T,
                kOPEN_PERMISSION_ADD_SHARE,
                kOPEN_PERMISSION_ADD_TOPIC,
                kOPEN_PERMISSION_CHECK_PAGE_FANS,
                kOPEN_PERMISSION_DEL_IDOL,
                kOPEN_PERMISSION_DEL_T,
                kOPEN_PERMISSION_GET_FANSLIST,
                kOPEN_PERMISSION_GET_IDOLLIST,
                kOPEN_PERMISSION_GET_INFO,
                kOPEN_PERMISSION_GET_OTHER_INFO,
                kOPEN_PERMISSION_GET_REPOST_LIST,
                kOPEN_PERMISSION_LIST_ALBUM,
                kOPEN_PERMISSION_UPLOAD_PIC,
                kOPEN_PERMISSION_GET_VIP_INFO,
                kOPEN_PERMISSION_GET_VIP_RICH_INFO,
                kOPEN_PERMISSION_GET_INTIMATE_FRIENDS_WEIBO,
                kOPEN_PERMISSION_MATCH_NICK_TIPS_WEIBO,
                        nil];
    }

    return self;
}

- (void)login {
    if (![TencentOAuth iphoneQQInstalled]) {
        [self didStrError:@"您手机还没有安装QQ！"];
    }
    else
        [_tencentOAuth authorize:_permissions inSafari:NO];
}

-(void)tencentDidNotLogin:(BOOL)cancelled
{
    [self didStrError:cancelled ? @"您取消了QQ登录！" : LOGIN_ERROR];
}
-(void)tencentDidNotNetWork
{
    [self didStrError:NOT_NETWORK];
}

-(void) getQQUserInfo
{
    [_tencentOAuth getUserInfo];
}

- (void)tencentDidLogin
{
    [self didStart];

    if (  ! ( ![_tencentOAuth.accessToken isEmpty] ) )
        [self didStrError:LOGIN_ERROR];
    else
    {
        [_loginInfo setSession:_tencentOAuth.openId];
        [self getQQUserInfo];
    }
}

- (void)getUserInfoResponse:(APIResponse*) response {
    if (response.retCode == URLREQUEST_SUCCEED)
    {
        NSDictionary *qqUserInfo = response.jsonResponse;

        [_loginInfo setNickname:[qqUserInfo objectForKey:@"nickname"]];
        [_loginInfo setSex:[qqUserInfo objectForKey:@"gender"]];
        [_loginInfo setBirthday: [qqUserInfo objectForKey:@"year"]];
        [_loginInfo setHead: [qqUserInfo objectForKey:@"figureurl_qq_2"]];
        [_loginInfo setLocation:[NSString stringWithFormat:@"%@ %@",[qqUserInfo objectForKey:@"province"],[qqUserInfo objectForKey:@"city"]]];
    }
    else
    {
        [self didStrError:LOGIN_ERROR];
    }
}
@end