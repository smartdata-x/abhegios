//
//  AppTableViewCellSytle1.h
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>
#import "InfoViewStyle.h"

#define AppTableViewCellStyle1_Action 1
@interface AppTableViewCellStyle1 : OEZTableViewCell
@property (weak, nonatomic) IBOutlet InfoViewStyle *appInfoView;

@end
