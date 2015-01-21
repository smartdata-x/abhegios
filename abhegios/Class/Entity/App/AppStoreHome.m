//
// Created by 180 on 15/1/20.
// Copyright (c) 2015 180. All rights reserved.
//

#import "AppStoreHome.h"
#import "AppInfo.h"
#import "AppInfoGroup.h"

@implementation AppStoreHome {

}
- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        static NSArray *g_array = nil;
        if (g_array == nil) {
            g_array =  [AppInfoGroup initWithsPlistResource:@"appstorehome"  ofType:@"plist"];
        }
        for (AppInfoGroup *group in g_array) {
                [group setAppInfosDictionarys:[dict objectForKey:[group key]]];
        }
        _appInfoGroups = g_array;
    }
    return self;
}
@end