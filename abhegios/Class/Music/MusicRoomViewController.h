//
//  MusicRoomViewController.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/3.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicInfoViewStyle1.h"

@interface MusicRoomViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet MusicInfoViewStyle1 *viewStyle1;
@property (weak, nonatomic) IBOutlet UIImageView *trash;
@property (weak, nonatomic) IBOutlet UIImageView *love;
@property (weak, nonatomic) IBOutlet UIImageView *next;
@end
