//
//  BookChapterInfo.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/26.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookInfo.h"

@interface BookChapterInfo : BookInfo
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *chaptername;
@property NSInteger bookid;
@end
