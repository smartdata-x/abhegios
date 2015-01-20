//
//  FoundViewController.m
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "FoundViewController.h"
#import "NSString+NSStringCategory.h"

@interface FoundViewController ()
{
    NSMutableArray * _dataArrays;
}
@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString        *plistPath  = [[NSBundle mainBundle] pathForResource:@"uifounddata" ofType:@"plist"];
    _dataArrays  = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if( section == 0)
        return [_dataArrays count];
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:@"FoundTableViewCell"];
    if (indexPath.section == 0)
    {
        NSDictionary *dictionary = [_dataArrays objectAtIndex:indexPath.row];
        [[viewCell textLabel] setText:[ dictionary objectForKey:@"title"]];
        [[viewCell imageView] setImage:[UIImage imageNamed:[ dictionary objectForKey:@"icon"]]];

    }
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([indexPath section] == 0)
    {
        NSString *identifier = [[_dataArrays objectAtIndex:[indexPath row]] objectForKey:@"identifier"];
        if (  [identifier isNotEmpty] ) {
              [self.tabBarController.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:identifier] animated:YES];
        }
    }
}

@end
