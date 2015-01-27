//
//  HTTPReqeust.m
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "HTTPReqeust.h"
#import "AFNetworking.h"
@implementation HTTPReqeust

-(void) request:(NSString*) url parameter:(NSDictionary*) parameter completeBlock:(CompleteBlock) completeBlock errorBlock:(ErrorBlock) errorBlock 
{

    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString: url]];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET" path:nil parameters:parameter];
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


-(void) request:(NSString*) url delegate:(id<ReqeustDelegate>) delegate processBlock:(ProcessBlock) processBlock
{
    [self request:url parameter:nil delegate:delegate processBlock:processBlock];
}

-(void) request:(NSString*) url parameter:(NSDictionary*) parameter delegate:(id<ReqeustDelegate>) delegate processBlock:(ProcessBlock) processBlock
{
    [self request:url parameter:parameter completeBlock:^(id data)
    {
        if( processBlock != nil )
            data = processBlock(data);
         if ( [data isKindOfClass:[NSError class]] )
         {
             if( [delegate respondsToSelector:@selector(reqeust:didError:)])
                 [delegate reqeust:self didError:data];
         }
         else if( [delegate respondsToSelector:@selector(reqeust:didComplete:)])
             [delegate reqeust:self didComplete:data];
           } errorBlock:^(NSError *error) {
        if( [delegate respondsToSelector:@selector(reqeust:didError:)])
            [delegate reqeust:self didError:error];
    }];

}

-(void) requestJson:(NSString*) url delegate:(id<ReqeustDelegate>) delegate processBlock:(ProcessBlock) processBlock
{
    [self requestJson:url parameter:nil delegate:delegate processBlock:processBlock];
}

-(id) jsonProcess:(id) data
{
    NSError *error = nil;
    data = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if ( error == nil)
    {
        return data;
    }
    return error;
}

-(void) requestJson:(NSString*) url parameter:(NSDictionary*) parameter delegate:(id<ReqeustDelegate>) delegate processBlock:(ProcessBlock) processBlock
{
    [self request:url parameter:parameter delegate:delegate processBlock:^id(id data) {
        data = [self jsonProcess:data];
        if ( processBlock != nil && ! [data isKindOfClass:[NSError class]] ) {
            data = processBlock(data);
        }
        return data;
    }];
}
@end
