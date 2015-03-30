//
//  MusicFMTableViewController.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>
#import "MusicInfoViewStyle2.h"
@interface MusicFMViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, MusicPlayerHelperDelegate>
@property (nonatomic, retain) IBOutlet MusicInfoViewStyle2 *player;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@end
