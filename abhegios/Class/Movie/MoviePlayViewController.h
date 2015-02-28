//
//  MoviePlayViewController.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>
#import "HighLevelMoviePlayerView.h"

@interface MoviePlayViewController : UIViewController
{
    float totalDuration;
    float currentProcess;
    BOOL isPlaying;
}
@property (nonatomic, retain) IBOutlet HighLevelMoviePlayerView *moviePlayerView;
@property (nonatomic, weak) IBOutlet UISlider *sliderProcess;
@property (nonatomic, weak) IBOutlet UISlider *sliderVolume;
@property (nonatomic, weak) IBOutlet UIButton *btnPlayPause;

- (IBAction)moviePlayDidEnd:(id)sender;
- (IBAction)doPlayOrPause:(id)sender;
@end
