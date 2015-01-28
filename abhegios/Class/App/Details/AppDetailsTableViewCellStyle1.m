//
//  AppDetailsTableViewCellStyle1.m
//  abhegios
//
//  Created by 180 on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppDetailsTableViewCellStyle1.h"
#import "AppDetailsInfo.h"
#import "UIImageView+AFNetworking.h"
@implementation AppDetailsTableViewCellStyle1

-(void) awakeFromNib
{
    [super awakeFromNib];
    [_pageView setDelegate:self];
    [[_logo layer] setCornerRadius:8.0f];
    [[_logo layer] setMasksToBounds:YES];
    [_downButton.layer setMasksToBounds:YES];
    [_downButton.layer setCornerRadius:8.0];
    [_downButton.layer setBorderWidth:1.0];
    [_downButton.layer setBorderColor:[ [[_downButton titleLabel] textColor]CGColor]];//边框颜色
    
}
-(NSInteger) numberPageCountPageView:(OEZPageView *)pageView
{
    return [[(AppDetailsInfo*)self.data pic] count];
}

-(OEZPageViewCell*) pageView:(OEZPageView *)pageView cellForPageAtIndex:(NSInteger)pageIndex
{
    OEZPageViewImageCell *cell = [pageView dequeueReusableCellWithIdentifier:@"PageViewImageCell"];
    [[cell contentImage] setImageWithStrURL:[[(AppDetailsInfo*)self.data pic] objectAtIndex:pageIndex ]];
    return cell;
}

-(void) setData:(id)data
{
    [super setData:data];
    AppDetailsInfo* info = data;
    [_pageView reloadData];
    [_logo setImageWithStrURL:[(AppDetailsInfo*)self.data logo]];
    [_name setText:[self.data name]];
    [_sizeAndVer setText:[NSString stringWithFormat:@"大小:%0.2fM  版本%@",[info size],[info version]]];
    [_favRate setData:[self.data star]];
    
}
@end
