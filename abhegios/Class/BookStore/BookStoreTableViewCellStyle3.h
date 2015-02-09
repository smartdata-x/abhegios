//
//  BookStoreTableViewCellStyle3.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>
#import "BookHScrollViewCell1.h"
#import "BookHScrollViewCell4.h"

@protocol BookStoreTableViewCellStyle3Delegate <NSObject>
- (void)cellItemClickedAtIndex:(NSInteger)index;
- (void)cellItemClickedByView:(id)clickedView;
@end

@interface BookStoreTableViewCellStyle3 : OEZTableViewHScrollCell<OEZHScrollViewDelegate, BookHScrollViewCell1Delegate>
@property NSInteger cellStyle;
@property (nonatomic, assign) id <BookStoreTableViewCellStyle3Delegate> delegate;
- (void)setShowParameters:(NSInteger)style;
@end
