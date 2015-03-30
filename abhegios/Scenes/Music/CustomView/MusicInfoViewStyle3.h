//
//  MusicInfoViewStyle3.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/7.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicInfoViewStyle3 : OEZNibView
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
- (void)setData:(NSString *)leftName Right:(NSString *)rightName LeftMajor:(BOOL)leftMajor;
@end
