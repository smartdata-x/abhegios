//
//  OEZTableViewDelegate.h
//  OEZCommSDK
//
//  Created by 180 on 15/2/6.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OEZTableViewDelegate <NSObject>
@optional
- (void)tableView:(UITableView *)tableView rowAtIndexPath:(NSIndexPath *)indexPath didSelectColumnAtIndex:(NSInteger) column;
- (void)tableView:(UITableView *)tableView rowAtIndexPath:(NSIndexPath *)indexPath didAction:(NSInteger) action;
@end