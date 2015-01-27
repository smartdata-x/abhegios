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


-(void) request:(NSString*) path parameter:(NSDictionary*) parameter completeBlock:(CompleteBlock) completeBlock errorBlock:(ErrorBlock) errorBlock
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithDictionary:[_requestInfo toDictionary:NO]];
    if( parameter != nil)
        [parameters addEntriesFromDictionary:parameter];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString: KAppAPIBaseURL]];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET" path:path parameters:parameters];
    [request setTimeoutInterval:10];
    AFHTTPRequestOperation *operation = [httpClient HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ( completeBlock )
        {
            completeBlock(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if ( errorBlock ) {
            errorBlock(error);
        }
    }];
    [httpClient enqueueHTTPRequestOperation:operation];
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
    [self request:path parameter:parameter completeBlock:^(id data) {
        if( [delegate respondsToSelector:@selector(didComplete:)] )
        {
            data = [self jsonProcess:data];
            if ( [data isKindOfClass:[NSError class]] ) {
                if( [delegate respondsToSelector:@selector(didError:)])
                    [delegate didError:data];
            }
            else
            {
                if ( processBlock != nil)
                    data = processBlock(data);
                [delegate didComplete:data];
            }
            
        }
    } errorBlock:^(NSError *error) {
        if( [delegate respondsToSelector:@selector(didError:)])
            [delegate didError:error];
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

@end
