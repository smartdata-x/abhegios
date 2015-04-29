//
//  ShakeTask.m
//  abhegios
//
//  Created by yaobanglin on 15/4/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "ShakeTask.h"
#import "AppAPIHelper.h"
#import "InfoViewStyle.h"
#import "BeaconShakeView.h"
#import "BrowserViewController.h"
@interface AppShakeTask : ShakeTask

@end

@interface BeaconShakeTask : ShakeTask

@end

@interface WIFIShakeTask : ShakeTask

@end


@implementation ShakeTask

-(void) reqeust:(id)reqeust didComplete:(id)data
{

}

-(void)  didComplete:(id) data view:(UIView*) view
{
    if ( [_delegate conformsToProtocol:@protocol(ShakeTaskDelegate)]) {
        [_delegate shakeTask:self didComplete:data view:view];
    }
}

-(void) reqeust:(id)reqeust didError:(NSError *)err
{
    if ( [_delegate conformsToProtocol:@protocol(ShakeTaskDelegate)]) {
        [_delegate shakeTask:self didError:err];
    }
}

-(void) startReqeust
{
    
}

-(void) didSelect:(UIViewController*) viewController
{
    
}

+(ShakeTask*) shakeTaskFactory:(ShakeTaskType) type
{
    switch (type) {
        case ShakeTaskAppType:
            return [[AppShakeTask alloc] init];
        case ShakeTaskWIFIType:
            return [[WIFIShakeTask alloc] init];
        case ShakeTaskBeaconType:
            return [[BeaconShakeTask alloc] init];
 
        default:
            break;
    }
    return nil;
}
@end

@implementation AppShakeTask
{
    id _data;
}
-(void) startReqeust
{
    [[[AppAPIHelper shared] getApplyAPI] shake:self];
}

-(void) reqeust:(id)reqeust didComplete:(id)data
{
    _data = [data objectAtIndex:0];
    InfoViewStyle *view = [InfoViewStyle loadFromNib];
    [[view setupButton] setHidden:YES];
    [view setData:_data];
    [self didComplete:_data view:view];
}

-(void) didSelect:(UIViewController*) viewController
{
    [viewController.navigationController pushAppDetailsViewController:_data animated:YES];
}

-(NSString*) description
{
    return @"APP";
}
@end

@implementation BeaconShakeTask
{
    id _data;
}

-(void) didSelect:(UIViewController*) viewController
{
    [viewController.navigationController pushViewControllerWithIdentifier:@"BrowserViewController" completion:^(UIViewController *viewController) {
        [viewController setTitle:[_data name]];
        [(BrowserViewController*)viewController setUrl:(NSString*)[_data url]];
    } animated:YES];
}

-(void) reqeust:(id)reqeust didComplete:(id)data
{
    _data = data;
    BeaconShakeView *view = [BeaconShakeView loadFromNib];
    [view setData:data];
    [self didComplete:data view:view];
}

-(void) startReqeust
{
    [[[AppAPIHelper shared] getOtherAPI] shakeBeacon:@"FDA50693A4E24FB1AFCFC6EB07647825" mac:@"54:4A:16:3B:70:5E" delegate:self];
}

-(NSString*) description
{
    return @"周边";
}
@end

@implementation WIFIShakeTask

-(void) startReqeust
{
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"没有找到WIFI信息" forKey:NSLocalizedDescriptionKey];
    NSError *error = [NSError errorWithDomain:@"com.http.api" code:-1  userInfo:userInfo];
    [self reqeust:nil didError:error];
}

-(NSString*) description
{
    return @"WIFI";
}
@end