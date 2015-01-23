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
@interface AppInfoViewStyle1 : AppInfoViewStyle3
@property (weak, nonatomic) IBOutlet UILabel *down;
@property (weak, nonatomic) IBOutlet UIButton *setup;
@property (weak, nonatomic) IBOutlet UILabel *summary;
-(void) setData:(id)data;
@end
