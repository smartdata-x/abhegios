//
//  MusicInfoViewStyle4.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/10.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ROTATION_ANGLE   0.01
#define DEGREES_2_RADIANS(x) (0.0174532925 * (x))

@protocol MusicInfoViewStyle4Delegate <NSObject>
- (void)MusicInfoViewStyle4Clicked;
@end

@interface MusicInfoViewStyle4 : UIView
@property (retain, nonatomic) IBOutlet UIImageView *logo;
@property (retain, nonatomic) IBOutlet UIImageView *progress;
@property (nonatomic, retain) id<MusicInfoViewStyle4Delegate> delegate;
- (void)updateProcessLine:(CGFloat)rate;
- (void)setData:(id)data;
- (void)pauseTimer:(BOOL)pause;
- (void)updateRadius;
@end
