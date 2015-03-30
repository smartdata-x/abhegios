//
//  RefreshTableViewController.m
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "RefreshTableViewController.h"
NSString *const RefreshPullToRefresh = @"下拉刷新";
NSString *const RefreshReleaseToRefresh = @"松开立即刷新";
NSString *const RefreshRefreshing = @"刷新数据...";
NSString *const RefreshError = @"加载失败!";
#define kAfterDelay 0.25
@interface RefreshTableViewController()
@end
@implementation RefreshTableViewController
{
    
}

-(void) endRefreshing:(NSString*) msg
{
    
    [self.refreshControl endRefreshing];
    if( msg != nil )
        self.refreshControl.attributedTitle =  [[NSAttributedString alloc]initWithString:msg];
}

-(void) reqeust:(id)reqeust  didComplete:(id)data
{
    _tableViewData = data;
    [self.tableView reloadData];
    [self performSelector:@selector(endRefreshing:) withObject:nil afterDelay:kAfterDelay];
}

-(void) reqeust:(id)reqeust didError:(NSError *)err
{
    [self performSelector:@selector(endRefreshing:) withObject:nil afterDelay:kAfterDelay];
        NSLog(@"%@",err);
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    self.refreshControl = [[UIRefreshControl alloc]init];
    self.refreshControl.attributedTitle =  [[NSAttributedString alloc]initWithString:RefreshReleaseToRefresh];
    [self.refreshControl addTarget:self action:@selector(didRefresh) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
    [self performSelector:@selector(didRefresh) withObject:nil afterDelay:kAfterDelay];
    
}

-(void) didRefresh
{
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:RefreshRefreshing];
    [self didRequest];
}
  
-(void) didRequest
{
    
}
@end
