//
//  AppTableViewCellSytle1.m
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellStyle1.h"
#import "AppInfo.h"
@implementation AppTableViewCellStyle1



-(void) setData:(id)data
{
    [super setData:data];
    [_appInfoView setData:data];
    [[_appInfoView setupButton] addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(IBAction) doAction:(id)sender
{
    [self didSelectRowAction:AppTableViewCellStyle1_Action];
}

@end
