//
//  BeaconShakeView.h
//  abhegios
//
//  Created by yaobanglin on 15/4/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeaconShakeView : OEZNibView
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *summary;
-(void) setData:(id) data;
@end
