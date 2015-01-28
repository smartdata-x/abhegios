//
//  GameHScrollViewCell.h
//  abhegios
//
//  Created by 180 on 15/1/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <OEZCommSDK/OEZCommSDK.h>

@interface GameHScrollViewCell : OEZHScrollViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pic;
-(void) setData:(id) data;
@end
