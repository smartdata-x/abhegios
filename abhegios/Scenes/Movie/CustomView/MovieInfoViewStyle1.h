//
//  MovieInfoViewStyle1.h
//  abhegios
//
//  Created by Archer_LJ on 15/3/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieInfoViewStyle1 : OEZNibView
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *name;
- (void)setData:(id)data;
@end
