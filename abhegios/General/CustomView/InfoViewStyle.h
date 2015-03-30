//
//  AppInfoViewStyle1.h
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>
#import "AppInfoViewStyle3.h"
@interface InfoViewStyle : OEZNibView
@property (weak, nonatomic) IBOutlet UILabel *down;
@property (weak, nonatomic) IBOutlet UIButton *setupButton;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
-(void) setData:(id)data;
@end
