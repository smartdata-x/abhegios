//
//  BookInfo.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookInfo : OEZBaseEntity
@property NSUInteger id;
@property NSUInteger type;
@property NSUInteger order;
@property NSUInteger down;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *logo;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *favRate;

@end
