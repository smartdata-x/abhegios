//
//  HttpAPI.m
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "HttpAPI.h"
#import "AFNetworking.h"
@interface HttpAPI()
@property (nonatomic, retain) RequestInfo* requestInfo;
@end

@implementation HttpAPI

-(id) initWithRequest:(RequestInfo*) RequestInfo
{
    self = [self init];
    if( self != nil)
        _requestInfo = RequestInfo;
    return self;
}

-(id) jsonProcess:(id) data
{
    NSError *error = nil;
    data = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
     if ( error == nil)
     {
         if ( [[data objectForKey:@"status"] integerValue] == 1 )
             return [data objectForKey:@"result"];
         else
         {
              NSDictionary *userInfo = [NSDictionary dictionaryWithObject:[data objectForKey:@"msg"] forKey:NSLocalizedDescriptionKey];
            error = [NSError errorWithDomain:@"com.http.api" code:[[data objectForKey:@"flag"] integerValue] userInfo:userInfo];
         }
     }
    return error;
}

-(void) request:(NSString*) path parameter:(NSDictionary*) parameter delegate:(id<ReqeustDelegate>)delegate processBlock:(ProcessBlock) processBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:[_requestInfo toDictionary:NO]];
    if( parameter != nil)
        [parameters addEntriesFromDictionary:parameter];
    [super request:[KAppAPIBaseURL stringByAppendingString:path] parameter:parameters delegate:delegate processBlock:^id(id data) {
         data = [self jsonProcess:data];
        if ( ! [data isKindOfClass:[NSError class]]  && processBlock != nil)
            data = processBlock(data);
        return data;
    }];
}

-(void) request:(NSString*) path parameter:(NSDictionary*) parameter delegate:(id<ReqeustDelegate>) delegate entityClass:(Class) entityClass
{
    [self request:path parameter:parameter delegate:delegate processBlock:^id(id data) {
        if ([entityClass isSubclassOfClass:[OEZBaseEntity class]]) {
            return [[entityClass alloc] initWithDictionary:data];
        }
        else
           return data;
    }];
}

-(void) request:(NSString*) path delegate:(id<ReqeustDelegate>) delegate entityClass:(Class) entityClass
{
    [self request:path parameter:nil delegate:delegate entityClass:entityClass];
}


-(void) request:(NSString*) path  delegate:(id<ReqeustDelegate>)delegate processBlock:(ProcessBlock) processBlock
{
    [self request:path parameter:nil delegate:delegate processBlock:processBlock];
}
-(void) dealloc
{
    NSLog(@"dealloc %@",self);
}

@end
