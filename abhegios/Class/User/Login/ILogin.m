//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "ILogin.h"
#import "User.h"
#import "ThirdLoginInfo.h"


@implementation ILogin {

}
- (void)login {
    NSException *e = [NSException
            exceptionWithName: @"login异常"
                       reason: @"您还没有实现login方法！"
                     userInfo: nil];
    @throw e;
}

- (void)didStart {

    if ([self.delegate respondsToSelector:@selector(didLoginStart)])
        [self.delegate didLoginStart];
}

- (void)didOk:(User *)user {

    if ([self.delegate respondsToSelector:@selector(didLoginOk:)])
        [self.delegate didLoginOk:user];
}

- (void)didError:(NSError *)err {
    if ([self.delegate respondsToSelector:@selector(didLoginError:)])
        [self.delegate didLoginError:err];
}

-(void) didStrError:(NSString*) err
{
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:err forKey:NSLocalizedDescriptionKey];
    NSError *error = [NSError errorWithDomain:@"com.user.login" code:-1 userInfo:userInfo];
    [self didError:error];
}

@end


@implementation IThirdLogin


- (id)init:(LoginType)source {
    self = [super init];
    if (self) {
        _loginInfo = [[ThirdLoginInfo alloc] init];
        [_loginInfo setSource:source];
        [[HandleOpenURLHelper shared] addHandleDelegate:self];
    }
    return self;
}

- (void)login {

}

- (void)didOk:(User *)user {
    [super didOk:user];
    [[HandleOpenURLHelper shared] removeHandleDelegate:self];
}

- (void)didError:(NSError *)err {
    [super didError:err];
    [[HandleOpenURLHelper shared] removeHandleDelegate:self];
}

- (BOOL)handleOpenURL:(NSURL *)url {
    return NO;
}

- (NSString *)getKey {
    return @"nil";
}

@end