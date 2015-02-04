//
//  FundTableViewHeader.h
//  abhegios
//
//  Created by 180 on 15/2/4.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <OEZCommSDK/OEZCommSDK.h>
#import "SearchView.h"
@interface FundTableViewHeader : OEZNibView<OEZHScrollViewDelegate>
@property (weak, nonatomic) IBOutlet SearchView *searchView;
@property (weak, nonatomic) IBOutlet OEZHScrollView *hScrollView;

@end
