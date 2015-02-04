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
#import "SearchView.h"
@interface FoundViewController ()
{
    NSArray * _foundItemInfos;
    SearchView* _searchView;
}
@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _foundItemInfos =[FoundItemInfo initWithsPlistResource:@"uifounddata" ofType:@"plist"];
    _searchView = [SearchView loadFromNib];
    [self.tableView setTableHeaderView:_searchView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if( section == 0)
        return [_foundItemInfos count] +1;
    return 0;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        return 90;
    }
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:@"FoundTableViewCell"];
    if (indexPath.section == 0)
    {
        if ( indexPath.row == 0 ) {
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"FoundTableViewCell1"];
            [(OEZTableViewCell*)viewCell setData:nil];
        }
        else
        {
            FoundItemInfo *foundItemInfo = [_foundItemInfos objectAtIndex:indexPath.row-1];
            [[viewCell textLabel] setText:[foundItemInfo title]];
            [[viewCell imageView] setImage:[UIImage imageNamed:[foundItemInfo icon]]];
        }

    }
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([indexPath section] == 0 && [indexPath row] > 0 )
    {
        NSString *identifier = [[_foundItemInfos objectAtIndex:[indexPath row]-1] identifier];
        if (  [identifier isNotEmpty] ) {
            [self.tabBarController.navigationController pushViewControllerWithIdentifier:identifier completion:^(UIViewController *viewController) {
                NSLog(@"%@",viewController);
            } animated:YES];
        }
    }
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_searchView resignFirstResponder];
}

@end
