//
//  BookDetailInfo.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookInfo.h"

@interface BookDetailInfo : BookInfo
@property (nonatomic, copy) NSString *free;
@property (nonatomic, copy) NSString *chapter;
@end

@interface BookDetailPage : OEZBaseEntity
@property (nonatomic, retain) BookDetailInfo *summary;
@property (nonatomic, retain) NSArray *label;
@end
