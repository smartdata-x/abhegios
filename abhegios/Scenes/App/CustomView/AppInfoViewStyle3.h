//
//  AppInfoViewStyle3.h
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>
@interface AppInfoViewStyle3 : OEZNibView
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIView *logo;
-(void) setData:(id) data;
@end
