//
//  OEZTableViewCell.h
//  OEZCommSDK
//
//  Created by 180 on 14/9/21.
//  Copyright (c) 2014年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OEZTableViewCell : UITableViewCell
@property id data;

-(void) didSelectRowColumn:(NSUInteger) column;
-(void) didSelectRowAction:(NSUInteger) action;
@end
