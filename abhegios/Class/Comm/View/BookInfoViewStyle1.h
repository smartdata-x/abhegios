//
//  BookInfoViewStyle1.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>
typedef NS_ENUM(NSInteger, BookInfoViewStyle1Format) {
    BookInfoViewStyle1Format0 = 0,  // 图片带一个底部描述和图片内描述
    BookInfoViewStyle1Format1,      // 图片带一个底部描述
    BookInfoViewStyle1Format2,      // 只有图片，但是底部有一个21高度的空隙
};
@interface BookInfoViewStyle1 : OEZNibView
@property (weak, nonatomic) IBOutlet UIView *logo;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *summary;
- (void)setData:(id)data;
- (void)setDataWithFormat:(id)data Format:(NSInteger)format;
@end
