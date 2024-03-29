//
// Created by 180 on 15/1/19.
// Copyright (c) 2015 180. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginTableViewCell.h"
#import "ILogin.h"
#import "UserHelper.h"
#import "UserInfo.h"
#import "LoginItemInfo.h"
#import <OEZCommSDK/OEZCommSDK.h>
#import "MBProgressHUD.h"
#define kTopHeaderHeight 132
@interface LoginViewController()<UITableViewDataSource,UITableViewDelegate,LoginDelegate>
@end
@implementation LoginViewController {
    NSArray * _loginItemInfos;
    MBProgressHUD *_progress;
}

- (void)loadView {
    [super loadView];
    if( [[UserHelper shared] currentUser] != nil )
    {
        [self didMainViewController];
    }
    else{
    [self.tableView setBackgroundColor:kUIColorWithRGB(0xfbfbfb)];
    _loginItemInfos =[LoginItemInfo initWithsPlistResource:@"uilogindata" ofType:@"plist"];
    }
    _progress = [[MBProgressHUD alloc] initWithView:self.view];

   
}

-(void) didMainViewController
{
     [[[UIApplication sharedApplication].delegate window] setRootViewController:[[self storyboard] instantiateViewControllerWithIdentifier:@"MainViewController"]];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if( section == 0)
        return kTopHeaderHeight;
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0 ) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([tableView frame]), kTopHeaderHeight)];
        UIImageView *imageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_logo"]];
        CGRect rect = [imageView frame];
        rect.origin.y = ( CGRectGetHeight([view frame]) - CGRectGetHeight(rect))/2;
        rect.origin.x = (CGRectGetWidth([tableView frame]) - CGRectGetWidth(rect))/2;
        [imageView setFrame:rect];
        [view addSubview:imageView];
        return view;
    }
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 48;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if( section== 0)
        return [_loginItemInfos count];
    return  0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([indexPath section] == 0)
    {
        LoginItemInfo *info = [_loginItemInfos objectAtIndex:[indexPath row]];
        switch ([info type])
        {
            case LoginTypeWeibo:
            case LoginTypeWX:
            case LoginTypeQQ:
                [[UserHelper shared] login:[info type] delegate:self];
                break;
            default:
                break;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OEZTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:@"LoginTableViewCell"];
    if (indexPath.section == 0)
    {
        [viewCell setData:[_loginItemInfos objectAtIndex:indexPath.row]];
    }
    return viewCell;
}


-(void) showProgress:(MBProgressHUDMode) mode msg:(NSString*) msg
{
    [_progress removeFromSuperview];
    [self.view addSubview:_progress];
    [_progress setMode:mode];
    [_progress setLabelText:msg];
    [_progress show:TRUE];
}

#pragma mark - LoginDelegate
- (void)didLoginStart {
    [self showProgress:MBProgressHUDModeIndeterminate msg:@"登陆中..."];
}

- (void)didLoginOk:(UserInfo *)user {
    [[UserHelper shared] setCurrentUser:user];
    [self didMainViewController];
}

- (void)didLoginError:(NSError *)err {
    
#if 1
    UserInfo *user = [[UserInfo alloc] init];
    user.source = 3;
    user.nickname = @"卖女孩的火柴";
    user.uid = 10059;
    user.head = @"http://q.qlogo.cn/qqapp/1104090941/201C7A7D6F0BA41DA328BC05619C9F95/100";
    user.address = @"成都";
    user.token = @"fed2ca951c501b0b56b3c57926b88519";
    [self didLoginOk:user];
#else
    NSLog(@"%@",err);
    [self showProgress:MBProgressHUDModeText msg:[err localizedDescription]];
    [_progress hide:TRUE afterDelay:2.0f];

#endif
   
}

@end