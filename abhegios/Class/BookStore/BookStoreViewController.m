//
//  BookStoreViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookStoreViewController.h"
#import "BookStoreHome.h"
#import "BookInfoGroup.h"
#import "BookInfo.h"
#import "BookStoreTableViewCellStyle1.h"
#import "BookShelfViewController.h"
#import <OEZCommSDK/OEZCommSDK.h>
@interface BookStoreViewController ()
{
    BookStoreHome *_bookStoreHome;
}
@end

@implementation BookStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testData];
    
}

- (void)testData {
    _bookStoreHome = [BookStoreHome initWithJsonResource:@"bookstorehome_test" ofType:@"json"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)isSingleLine:(BookInfoGroup *)group {
    if ([group style] == BookStoreTableViewCellStyleOne) {
        return NO;
    }
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_bookStoreHome bookInfoGroups] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    BookInfoGroup *group = [[_bookStoreHome bookInfoGroups] objectAtIndex:section];
    if ([group style] == BookStoreTableViewCellStyleTwo) {
        return 0;
    }
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookInfoGroup *group = [[_bookStoreHome bookInfoGroups] objectAtIndex:indexPath.section];
    if (group.style == BookStoreTableViewCellStyleOne) {
        return 100;
    }
    else if (group.style == BookStoreTableViewCellStyleFour) {
        return 245;
    }
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    BookInfoGroup *group = [[_bookStoreHome bookInfoGroups] objectAtIndex:section];
    if ([self isSingleLine:group]) {
        int maxrows = [[group bookInfos] count];
        return MIN(1, maxrows);
    }
    return [[group bookInfos] count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    if (section != 0) {
        
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [view setBackgroundColor:kUIColorWithRGB(0xf3f3f3)];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [label setText:[[[_bookStoreHome bookInfoGroups] objectAtIndex:section] title]];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [view addSubview:label];
    }
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookInfoGroup *group = [[_bookStoreHome bookInfoGroups] objectAtIndex:indexPath.section];
    OEZTableViewCell *viewCell = nil;
    if ([self isSingleLine:group]) {
        viewCell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"BookStoreTableViewCellStyle%d", [group style]]];
        [viewCell setData:group];
    }
    else {
        viewCell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"BookStoreTableViewCellStyle%d", [group style]]];
        [viewCell setData:[[group bookInfos] objectAtIndex:indexPath.row]];
    }
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //[self.navigationController pushViewControllerWithIdentifier:@"BookShelfViewController" animated:YES];
    BookInfoGroup *group = [[_bookStoreHome bookInfoGroups] objectAtIndex:indexPath.section];
    BookShelfViewController *bookShelfView = [[self storyboard] instantiateViewControllerWithIdentifier:@"BookShelfViewController"];
    [bookShelfView setData:group];
    [self.navigationController pushViewController:bookShelfView animated:YES];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
