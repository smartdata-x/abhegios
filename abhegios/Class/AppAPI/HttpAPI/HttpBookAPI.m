//
//  HttpBookApi.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "HttpBookAPI.h"
#import "GroupInfo.h"
#import "BookInfo.h"
#import "BookDetailInfo.h"
#import "BookChapterInfo.h"

@implementation HttpBookAPI

- (void) getBookStoreHome:(id<ReqeustDelegate>)delegate {
    static NSString *path = @"/find/1/bookstore.fcgi";
    [self request:path delegate:delegate processBlock:^id(id data) {
        return [GroupInfo initWithsConfigAndDataDictionarys:@"bookstorehome" groupsData:data entityClass:[BookInfo class]];
    }];
}

- (void)getBookDetails:(NSInteger)bookID delegate:(id<ReqeustDelegate>)delegate {
    static NSString *path = @"/book/1/summary.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObject:@(bookID) forKey:@"bookid"] delegate:delegate entityClass:[BookDetailPage class]];
}

- (void)getBookSearchType:(NSInteger)bookType delegate:(id<ReqeustDelegate>)delegate {
    static NSString *path = @"/book/1/searchtype.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObject:@(bookType) forKey:@"btype"] delegate:delegate processBlock:^id(id data) {
        return [GroupInfo initWithsConfigAndDataDictionarys:@"bookstorehome" groupsData:data entityClass:[BookInfo class]];
    }];
}

- (void)getBookShelfList:(id<ReqeustDelegate>)delegate {
    static NSString *path = @"/book/1/booklist.fcgi";
    [self request:path delegate:delegate processBlock:^id(id data) {
        return [GroupInfo initWithsConfigAndDataDictionarys:@"bookstorehome" groupsData:data entityClass:[BookInfo class]];
    }];
}

- (void)getBookChapterList:(NSInteger)bookID BookToken:(NSString *)bookToken delegate:(id<ReqeustDelegate>)delegate {
    static NSString *path = @"/book/1/chapterlist.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@(bookID), bookToken, nil] forKeys:[NSArray arrayWithObjects:@"bookid", @"booktoken",  nil]] delegate:delegate processBlock:^id(id data) {
        return [GroupInfo initWithsConfigAndDataDictionarys:@"bookstorehome" groupsData:data entityClass:[BookChapterInfo class]];
    }];
}
@end
