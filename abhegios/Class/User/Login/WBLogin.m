//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "WBLogin.h"
#import "WeiboSDK.h"
#import "HTTPReqeust.h"
#define kWeiboUserShowURI @"https://api.weibo.com/2/users/show.json"
@interface WBLogin()<WeiboSDKDelegate>
@end

@implementation WBLogin {
    WBAuthorizeResponse *_authorizeResponse;
    HTTPReqeust         *_reqeust;
}
- (void)login {
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kWeiboRedirectURI;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"LoginTableViewController",
            @"Other_Info_1": [NSNumber numberWithInt:123],
            @"Other_Info_2": @[@"obj1", @"obj2"],
            @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};


    [WeiboSDK sendRequest:request];
}

- (id)init:(LoginType)source {
    self = [super init:source];
    if (self) {
        [WeiboSDK registerApp:kWeiboAppID];
    }

    return self;
}


-(NSString*) getKey
{
    return [NSString stringWithFormat:@"wb%@",kWeiboAppID];
}
-(BOOL) handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {

}

-(void) didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        switch (response.statusCode) {
            case WeiboSDKResponseStatusCodeSuccess:{//成功
                _authorizeResponse = (WBAuthorizeResponse*)response;
                 _loginInfo.session = _authorizeResponse.userID;
                [self getUserInfo];
                break;
            }
            case WeiboSDKResponseStatusCodeUserCancel://用户取消发送
                [self didStrError:@"您取消了微博登录！！"];
                break;
            case WeiboSDKResponseStatusCodeSentFail://发送失败
                [self didStrError:@"发送失败！"];
                break;
            case WeiboSDKResponseStatusCodeAuthDeny://授权失败
                [self didStrError:@"授权失败\n尚未安装微博客户端程序！"];
                break;
            case WeiboSDKResponseStatusCodeUserCancelInstall://用户取消安装微博客户端
                [self didStrError:@"用户取消安装微博客户端！"];
                break;
            case WeiboSDKResponseStatusCodeUnsupport://不支持的请求
                [self didStrError:@"不支持的请求！"];
                break;
            default:
                break;
        }
    }
}

-(void) reqeust:(id)reqeust didComplete:(id)data
{
    if (reqeust == _reqeust) {
        NSDictionary *dict = data;
        if ([dict objectForKey:@"error_code"] == nil)
        {
            [self didWBUserInfo:dict];
        }
        else{
            [self didStrError:[dict objectForKey:@"error_code"] ];
        }
    }
    else
        [super reqeust:reqeust didComplete:data];
}

-(void) getUserInfo
{
    [self didStart];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:kWeiboAppID forKey:@"source"];
    [dict setObject:_authorizeResponse.accessToken forKey:@"access_token"];
    [dict setObject:_authorizeResponse.userID forKey:@"uid"];
    _reqeust = [[HTTPReqeust alloc]init];
    [_reqeust requestJson:kWeiboUserShowURI parameter:dict delegate:self processBlock:nil];
}


-(void) didWBUserInfo:(NSDictionary*) wbUserInfo;
{
    [_loginInfo setNickname:[wbUserInfo objectForKey:@"screen_name"]];
    [_loginInfo setBirthday: [wbUserInfo objectForKey:@"year"]];
    [_loginInfo setHead:[wbUserInfo objectForKey:@"avatar_large"]];
    [_loginInfo setLocation:[NSString stringWithFormat:@"%@",[wbUserInfo objectForKey:@"location"]]];
    [_loginInfo setSex:[wbUserInfo objectForKey:@"gender"]];
    [super login];
}
@end