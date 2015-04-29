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
{
   @protected id                      _data;
}
-(void) reqeust:(id)reqeust didComplete:(id)data
{

}

-(void)  didComplete:(id) data view:(UIView*) view
{
     _data = data;
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

-(void) performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    [[self.delegate callViewController:self] performSegueWithIdentifier:identifier sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id viewController = segue.destinationViewController;
    if ( [viewController respondsToSelector:@selector(setData:)])
    {
        [viewController setData:_data];
    }
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
    [self performSegueWithIdentifier:@"AppDetailsSegue" sender:self];
}
-(void) startReqeust
{
    [[[AppAPIHelper shared] getApplyAPI] shake:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id viewController = segue.destinationViewController;
    if( [[segue identifier] isEqualToString:@"AppDetailsSegue"])
        [viewController setData:[_data objectAtIndex:0]];
    else
        [super prepareForSegue:segue sender:sender];
}

-(void) reqeust:(id)reqeust didComplete:(id)data
{
    InfoViewStyle *view = [InfoViewStyle loadFromNib];
    [view setUserInteractionEnabled:YES];
    [view addGestureRecognizer:_tapGestureRec];
    [[view setupButton] setHidden:YES];
    [view setData:[data objectAtIndex:0]];
    [self didComplete:data view:view];
}

-(void) didNext
{
    [self performSegueWithIdentifier:@"AppsShakeSegue" sender:self];
}

-(NSString*) description
{
    return @"APP";
}
@end

@implementation BeaconShakeTask
{
    
}

-(void) didNext
{
    [self performSegueWithIdentifier:@"BrowserSegue" sender:self];
}

-(void) reqeust:(id)reqeust didComplete:(id)data
{
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