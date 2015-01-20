//
// Created by 180 on 15/1/20.
// Copyright (c) 2015 180. All rights reserved.
//

#import "AppStoreHome.h"
#import "AppInfo.h"
#import "AppInfoGroup.h"

@implementation AppStoreHome {

}
- (id)init:(NSDictionary *)json {
    self = [super init];
    if (self) {
        static NSMutableArray *g_array = nil;
        if (g_array == nil) {
            g_array = [[NSMutableArray alloc] init];
            NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"appstorehome" ofType:@"plist"];
            NSArray *array = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
            for (NSDictionary* dic in array)
            {
                AppInfoGroup * group = [[AppInfoGroup alloc] init:dic];
                [group setList:[self dictsToObjs:[json objectForKey:[group key]]]];
                [g_array addObject:group];
            }
        }
        else{
            for (AppInfoGroup *group in g_array) {
                [group setList:[self dictsToObjs:[json objectForKey:[group key]]]];
            }
        }

       
        _list = g_array;
    }
    return self;
}

- (NSArray *)dictsToObjs:(NSArray *)dicts {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in dicts) {
        AppInfo *appInfo = [[AppInfo alloc] init:dict];
        [array addObject:appInfo];
    }
    return array;
}
@end