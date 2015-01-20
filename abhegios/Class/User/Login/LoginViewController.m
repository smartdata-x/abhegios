//
// Created by 180 on 15/1/19.
// Copyright (c) 2015 180. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginTableViewCell.h"
#import "ILogin.h"
#import "UserHelper.h"
#import "User.h"

#define kTopHeaderHeight 132
@interface LoginViewController()<UITableViewDataSource,UITableViewDelegate,LoginDelegate>
@end
@implementation LoginViewController {
    NSMutableArray * _dataArrays;
}

- (void)loadView {
    [super loadView];
    [self.tableView setBackgroundColor:kUIColorWithRGB(0xfbfbfb)];
    NSString        *plistPath  = [[NSBundle mainBundle] pathForResource:@"uilogindata" ofType:@"plist"];
    _dataArrays  = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
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
        return [_dataArrays count];
    return  0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([indexPath section] == 0)
    {
        NSInteger type = [[[_dataArrays objectAtIndex:[indexPath row]] objectForKey:@"type"] integerValue];
        switch (type)
        {
            case WeiboLogin_Source:
            case WXLogin_Source:
            case QQLogin_Source:
                [[UserHelper shared] login:type delegate:self];
                break;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:@"LoginTableViewCell"];
    if (indexPath.section == 0)
    {
        NSDictionary *dictionary = [_dataArrays objectAtIndex:indexPath.row];
        [[viewCell textLabel] setText:[ dictionary objectForKey:@"title"]];
        [[viewCell imageView] setImage:[UIImage imageNamed:[ dictionary objectForKey:@"icon"]]];

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