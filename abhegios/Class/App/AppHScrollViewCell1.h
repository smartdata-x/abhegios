//
//  AppHScrollViewCell1.h
//  abhegios
//
//  Created by 180 on 15/1/26.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <OEZCommSDK/OEZCommSDK.h>

@interface AppHScrollViewCell1 : OEZHScrollViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIView *logo;
-(void) setData:(id) data;
@end
