//
//  umengTrackHelper.m
//  abhegios
//
//  Created by Archer_LJ on 15/4/7.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "umengTrackHelper.h"
#import "MobClick.h"

@implementation umengTrackHelper
HELPER_SHARED
- (void)startTrack {
    
    [MobClick setCrashReportEnabled:NO]; // 如果不需要捕捉异常，注释掉此行
#if DEBUG
    [MobClick setLogEnabled:NO];  // 打开友盟sdk调试，注意Release发布时需要注释掉此行,减少io消耗
#endif
    [MobClick setAppVersion:XcodeAppVersion]; //参数为NSString * 类型,自定义app版本信息，如果不设置，默认从CFBundleVersion里取
    //
    [MobClick startWithAppkey:kUmeng reportPolicy:(ReportPolicy) REALTIME channelId:nil];
    //   reportPolicy为枚举类型,可以为 REALTIME, BATCH,SENDDAILY,SENDWIFIONLY几种
    //   channelId 为NSString * 类型，channelId 为nil或@""时,默认会被被当作@"App Store"渠道
    
    //[MobClick checkUpdate];   //自动更新检查, 如果需要自定义更新请使用下面的方法,需要接收一个(NSDictionary *)appInfo的参数
    [MobClick checkUpdateWithDelegate:self selector:@selector(updateMethod:)];
    
    [MobClick updateOnlineConfig];  //在线参数配置
}

//自动更新
-(void)updateMethod:(NSDictionary *)appInfo {
    NSLog(@"update info %@",appInfo);
    if([[appInfo objectForKey:@"update"] isEqualToString:@"YES"]==YES)
    {
        NSString *newVersion = [[NSString alloc]initWithString:[appInfo objectForKey:@"version"]];
        self.path = [[NSString alloc]initWithString:[appInfo objectForKey:@"path"]];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"有新版本V%@",newVersion] message:[NSString stringWithString:[appInfo objectForKey:@"update_log"]] delegate:self cancelButtonTitle:@"下次再说" otherButtonTitles:@"更新", nil];
        [alert show];
        
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        NSURL *url = [NSURL URLWithString: self.path];  [[UIApplication sharedApplication]openURL:url];
    }
}
@end
