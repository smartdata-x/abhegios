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
#import "AppsShakeViewController.h"
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

-(void) didNext
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
    id                      _data;
    UITapGestureRecognizer  *_tapGestureRec;
}
-(id) init
{
    self = [super init];
    _tapGestureRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didAppInfo:)];
    return self;
}
-(IBAction) didAppInfo:(id)sender
{
    [[[self.delegate callViewController:self] navigationController] pushAppDetailsViewController:[_data objectAtIndex:0] animated:YES];
}
-(void) startReqeust
{
    [[[AppAPIHelper shared] getApplyAPI] shake:self];
}

-(void) reqeust:(id)reqeust didComplete:(id)data
{
    _data = data;
    InfoViewStyle *view = [InfoViewStyle loadFromNib];
    [view setUserInteractionEnabled:YES];
    [view addGestureRecognizer:_tapGestureRec];
    [[view setupButton] setHidden:YES];
    [view setData:[data objectAtIndex:0]];
    [self didComplete:[data objectAtIndex:0] view:view];
}

-(void) didNext

{
    
    [[[self.delegate callViewController:self] navigationController ] pushViewControllerWithIdentifier:@"AppsShakeViewController" completion:^(UIViewController *viewController) {
        [(AppsShakeViewController*)viewController setData:_data];
    } animated:YES];
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

-(void) didNext
{
     [[[self.delegate callViewController:self] navigationController ]  pushViewControllerWithIdentifier:@"BrowserViewController" completion:^(UIViewController *viewController) {
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