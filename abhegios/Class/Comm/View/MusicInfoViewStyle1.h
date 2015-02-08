//
//  MusicInfoViewStyle1.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ROTATION_ANGLE   0.01
#define DEGREES_2_RADIANS(x) (0.0174532925 * (x))

@protocol MusicInfoViewStyle1Delegate <NSObject>
- (void)MusicInfoViewStyle1Clicked;
@end

@interface MusicInfoViewStyle1 : OEZNibView
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIImageView *progress;
@property (nonatomic, retain) id<MusicInfoViewStyle1Delegate> delegate;
- (void)updateProcessLine:(CGFloat)rate;
- (void)setData:(id)data;
- (void)pauseTimer:(BOOL)pause;
@end
