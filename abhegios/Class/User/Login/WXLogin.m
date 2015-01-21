//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "WXLogin.h"
#import "WXApi.h"

@interface WXLogin()<WXApiDelegate>

@end
@implementation WXLogin
{

}


- (id)init:(LoginType)source {
    self = [super init:source];
    if (self) {
        [WXApi registerApp:kWXAppID];
    }

    return self;
}

- (void)login {
    if( ! [WXApi isWXAppInstalled] )
    {
        [self didStrError:@"您手机还没有安装微信！"];
    }
    else{
        SendAuthReq* req =[[SendAuthReq alloc ] init  ];
        req.scope = @"snsapi_userinfo";
        req.state = @"wechat_sdk_demo";
        //第三方向微信终端发送一个SendAuthReq消息结构
        [WXApi sendReq:req];
    }
}

-(void) onReq:(BaseReq*)req
{

}

-(void) onResp:(BaseResp*)resp
{
    if( [resp isKindOfClass:[SendAuthResp class]])
    {
        switch (resp.errCode) {
            case -4:
                [self didStrError:@"您拒绝授权微信登录！"];
                break;
            case -2:
                [self didStrError:@"您取消了微信登录！"];
                break;
            case 0:
                [self getAccess_token:((SendAuthResp*)resp).code];
                break;
            default:
                break;
        }
    }

}

-(void) getAccess_token:(NSString*) code
{

}

-(BOOL) handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}

-(NSString*) getKey
{
    return kWXAppID;
}


@end