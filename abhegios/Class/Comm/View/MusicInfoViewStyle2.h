//
//  MusicInfoViewStyle2.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/4.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicInfoViewStyle1.h"
@interface MusicInfoViewStyle2 : OEZNibView
@property (weak, nonatomic) IBOutlet MusicInfoViewStyle1 *viewStyle1;
@property (weak, nonatomic) IBOutlet UIButton *love;
@property (weak, nonatomic) IBOutlet UIButton *trash;
@property (weak, nonatomic) IBOutlet UIButton *next;
- (void)setData:(id)data;
@end
