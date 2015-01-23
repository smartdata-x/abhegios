//
//  OEZXibView.h
//  OEZCommSDK
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OEZNibView : UIView
@property (strong, nonatomic) IBOutlet UIView *contentView;
+ (id) loadFromNib;
@end
