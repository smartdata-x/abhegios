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

- (void)awakeFromNib {
    
}



-(void) setData:(id)data
{
    [super setData:data];
    [_appInfoView setData:data];
}

@end
