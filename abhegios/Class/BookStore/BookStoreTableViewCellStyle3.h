//
//  BookStoreTableViewCellStyle3.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>

@protocol BookStoreTableViewCellStyle3Delegate <NSObject>
- (void)cellItemClickedAtIndex:(NSInteger)index;
@end

@interface BookItemView : UIView
@end

@interface BookStoreTableViewCellStyle3 : OEZHScrollTableViewCell
@property (nonatomic, assign) id <BookStoreTableViewCellStyle3Delegate> delegate;
@end
