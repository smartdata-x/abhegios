//
//  AppTableViewCellSytle1.h
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppInfo;
@interface AppTableViewCellSytle1 : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UIButton *setupButton;
-(void) setData:(AppInfo*) appinfo;
@end
