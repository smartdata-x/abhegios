//
//  DirectMPMoviePlayerViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/4/16.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "DirectMPMoviePlayerViewController.h"

@implementation DirectMPMoviePlayerViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    //return UIDeviceOrientationIsLandscape(toInterfaceOrientation);
    return YES;
}

#if 0
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}
#endif

- (BOOL)shouldAutorotate {
    return YES;
}

@end
