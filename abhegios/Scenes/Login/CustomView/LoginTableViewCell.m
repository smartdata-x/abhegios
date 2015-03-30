//
//  LoginTableViewCell.m
//  abhegios
//
//  Created by 180 on 15/1/19.
//  Copyright (c) 2015 180. All rights reserved.
//

#import "LoginTableViewCell.h"
#import "LoginItemInfo.h"
#define kLeftOff 85
@implementation LoginTableViewCell
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.imageView setFrame:CGRectOffset([self.imageView frame],kLeftOff,0)];
    [self.textLabel setFrame:CGRectOffset([self.textLabel frame],kLeftOff,0)];
}

-(void) setData:(id)data
{
    [super setData:data];
    [self.textLabel setText:[ data title]];
    [self.imageView setImage:[UIImage imageNamed:[(LoginItemInfo*)data icon]]];
}
@end
