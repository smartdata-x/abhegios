//
//  BookInfo.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppInfo.h"

@interface BookInfo : BaseInfoMoreONS
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *booktoken;
@property float star;
@property NSInteger follow;
@property NSInteger read;
@end
