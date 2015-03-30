//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "UserHelper.h"
#import "WBLogin.h"
#import "QQLogin.h"
#import "WXLogin.h"
#import "UserInfo.h"

@implementation UserHelper {
    NSString *_filename;
}
HELPER_SHARED


-(id) init
{
    self = [super init];
    if( self != nil )
    {
        NSArray *paths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        _filename = [paths    objectAtIndex:0];
        _filename = [_filename stringByAppendingPathComponent:@"currentuser.plist"];
        if (_filename != nil ) {
            NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:_filename];
            if( dict != nil)
                _currentUser = [UserInfo initWithDictionary:dict];
        }
    }
    return self;
}

-(void) login:(LoginType) source delegate:(id<LoginDelegate>) delegate{
    static ILogin *login = nil;
    switch (source)
    {
       case LoginTypeWeibo:
           login =  [[WBLogin alloc] init:source];
            break;
       case LoginTypeWX:
           login =  [[WXLogin alloc] init:source];
            break;
       case LoginTypeQQ:
           login = [[QQLogin alloc] init:source];
            break;
        default:
            break;
    }
    [login setDelegate:delegate];
    [login login];
}

-(void) setCurrentUser:(UserInfo *)currentUser
{
    _currentUser = currentUser;
    [self saveUser];
}


-(void) saveUser
{
    if( _currentUser != nil )
    {
        
        NSMutableDictionary *userDict = [[NSMutableDictionary alloc] initWithDictionary:[_currentUser toDictionary:FALSE]];
        [userDict writeToFile:_filename atomically:YES];
    }
    
}

- (void) logout
{
    _currentUser = nil;
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    NSError *error;
    [fileManager removeItemAtPath:_filename error:&error];
}

@end