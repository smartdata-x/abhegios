//
//  FoundViewController.m
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "FoundViewController.h"
#import "FoundItemInfo.h"
#import "NSString+NSStringCategory.h"
#import <OEZCommSDK/OEZCommSDK.h>
@interface FoundViewController ()
{
    NSArray * _foundItemInfos;
}
@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _foundItemInfos =[FoundItemInfo initWithsPlistResource:@"uifounddata" ofType:@"plist"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if( section == 0)
        return [_foundItemInfos count];
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:@"FoundTableViewCell"];
    if (indexPath.section == 0)
    {
        FoundItemInfo *foundItemInfo = [_foundItemInfos objectAtIndex:indexPath.row];
        [[viewCell textLabel] setText:[foundItemInfo title]];
        [[viewCell imageView] setImage:[UIImage imageNamed:[foundItemInfo icon]]];

    }
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([indexPath section] == 0)
    {
        NSString *identifier = [[_foundItemInfos objectAtIndex:[indexPath row]] identifier];
        if (  [identifier isNotEmpty] ) {
            [self.tabBarController.navigationController pushViewControllerWithIdentifier:identifier completion:^(UIViewController *viewController) {
                NSLog(@"%@",viewController);
            } animated:YES];
        }
    }
}

@end
