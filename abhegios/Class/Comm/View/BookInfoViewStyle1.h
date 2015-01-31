//
//  BookInfoViewStyle1.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>

@protocol BookInfoViewStyle1Delegate <NSObject>
- (void)didBookInfoViewStyle1Clicked:(id)bookInfoView;
@end
@interface BookInfoViewStyle1 : OEZNibView
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (nonatomic, retain) id<BookInfoViewStyle1Delegate> delegate;
- (void)setData:(id)data;
- (void)didClicked:(UIGestureRecognizer *)gesture;
@end
