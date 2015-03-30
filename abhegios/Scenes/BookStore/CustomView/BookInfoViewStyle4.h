//
//  BookInfoViewStyle4.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookInfoViewStyle1.h"
@interface BookInfoViewStyle4 : OEZNibView
@property (nonatomic, retain) IBOutlet BookInfoViewStyle1 *mainInfoView;
@property (nonatomic, retain) IBOutlet UILabel *summary;
- (void)setData:(id)data;
@end
