//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "WXLogin.h"
#import "WXApi.h"
#import "HTTPReqeust.h"
#define kWX_OPEN_URL  @"https://api.weixin.qq.com/sns"
#define kWXAPP_SECRET @"cc36f47b33a193a11a4cc942464dca67"
@interface WXLogin()<WXApiDelegate>

@end
@implementation WXLogin
{
    HTTPReqeust         *_reqeust;
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

-(void) reqeust:(id)reqeust didComplete:(id)data
{
    if (reqeust == _reqeust) {
        if ([data objectForKey:@"access_token"] != nil  ) {
            [self getUserInfo:[data objectForKey:@"access_token"] openId:[data objectForKey:@"openid"]];
        }
        NSLog(@"%@",data);
    }
    else
        [super reqeust:reqeust didComplete:data];
}

-(void) getAccess_token:(NSString*) code
{
    NSString *url =[NSString stringWithFormat:@"%@/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code"
                    ,kWX_OPEN_URL,kWXAppID,kWXAPP_SECRET,code];
    _reqeust = [[HTTPReqeust alloc] init];
    [_reqeust requestJson:url delegate:self processBlock:nil];
}

-(void) getUserInfo:(NSString*) token openId:(NSString*) openId
{
    NSString *url = [NSString stringWithFormat:@"%@/userinfo?access_token=%@&openid=%@",kWX_OPEN_URL,token,openId];
    _reqeust = [[HTTPReqeust alloc] init];
     [_reqeust requestJson:url delegate:self processBlock:nil];
    
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