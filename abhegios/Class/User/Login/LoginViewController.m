//
// Created by 180 on 15/1/19.
// Copyright (c) 2015 180. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginTableViewCell.h"
#import "ILogin.h"
#import "UserHelper.h"
#import "User.h"
#import "LoginItemInfo.h"
#import "BaseEntity.h"

#define kTopHeaderHeight 132
@interface LoginViewController()<UITableViewDataSource,UITableViewDelegate,LoginDelegate>
@end
@implementation LoginViewController {
    NSArray * _loginItemInfos;
}

- (void)loadView {
    [super loadView];
    [self.tableView setBackgroundColor:kUIColorWithRGB(0xfbfbfb)];
    _loginItemInfos =[LoginItemInfo initWithsResource:@"uilogindata" ofType:@"plist"];

   
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
    
    BaseTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:@"LoginTableViewCell"];
    if (indexPath.section == 0)
    {
        [viewCell setData:[_loginItemInfos objectAtIndex:indexPath.row]];
    }
    return viewCell;
}
#pragma mark - LoginDelegate
- (void)didLoginStart {

}

- (void)didLoginOk:(User *)user {

}

- (void)didLoginError:(NSError *)err {

}

@end