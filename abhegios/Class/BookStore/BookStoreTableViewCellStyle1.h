//
//  BookStoreTableViewCellStyle1.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>
#import "BookInfoViewStyle2.h"
@interface BookStoreTableViewCellStyle1 : OEZTableViewCell
@property (weak, nonatomic) IBOutlet BookInfoViewStyle2 *bookInfoView;
@end
