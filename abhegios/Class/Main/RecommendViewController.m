//
//  RecommendViewController.m
//  abhegios
//
//  Created by 180 on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "RecommendViewController.h"
#import "GroupInfo.h"

typedef NS_ENUM(NSInteger, AppTableViewCellStyle) {
    RecommendTableViewCellStyleNone = 0,
    RecommendTableViewCellStyleOne,
    RecommendTableViewCellStyleTwo
};

@interface RecommendViewController ()
{
 NSArray   *_recommendHomeGroups;
}
@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testData];
}

-(void) testData
{
    _recommendHomeGroups = [GroupInfo initWithsConfigAndDataJsonFile:@"recommendhome" jsonName:@"recommendhome_test"];
}

-(BOOL) isSingleLine:(GroupInfo*) group
{
    switch ([group style]) {
        case RecommendTableViewCellStyleTwo:
            return YES;
        default:
            return NO;
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    GroupInfo *group = [_recommendHomeGroups objectAtIndex:section];
    if( [group style] == RecommendTableViewCellStyleTwo )
        return 0;
    return 22;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_recommendHomeGroups count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupInfo *group = [_recommendHomeGroups objectAtIndex:indexPath.section];
    if ( group.style == RecommendTableViewCellStyleTwo) {
        return 49;
    }
    return 80;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupInfo *group = [_recommendHomeGroups objectAtIndex:section];
    if ( [self isSingleLine:group] ) {
        return [[group entitys] count] > 0 ? 1 : 0;
    }
    return [[group entitys] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupInfo *group = [_recommendHomeGroups objectAtIndex:[indexPath section]];
    if ( [group style] <= RecommendTableViewCellStyleTwo) {
         OEZTableViewCell* viewCell =  [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"RecommendTableViewCellStyle%@",@([group style])]];
        if( [group style] == RecommendTableViewCellStyleTwo )
        {
            [viewCell setData:[group entitys]];
            [viewCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        else
            [viewCell setData:[[group entitys] objectAtIndex:indexPath.row]];
        return viewCell;
    }
      return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RecommendTableViewCellStyleNone"];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    if( section != 0 )
    {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 22)];
        [view setBackgroundColor:kUIColorWithRGB(0xf3f3f3)];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, kMainScreenWidth-20, 21)];
        [label setText:[[_recommendHomeGroups objectAtIndex:section] title]];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [view addSubview:label];
    }
    return view;
}

@end
