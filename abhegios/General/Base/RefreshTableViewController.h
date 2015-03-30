//
//  RefreshTableViewController.h
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReqeustDelegate.h"
#import <OEZCommSDK/OEZTableViewDelegate.h>
@interface RefreshTableViewController : UITableViewController<ReqeustDelegate,OEZTableViewDelegate>
{
    @protected
    id      _tableViewData;
}
-(void) didRequest;
@end
