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
#import "BookReaderViewController.h"
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    BookInfoGroup *group = [[_bookStoreHome bookInfoGroups] objectAtIndex:section];
    if ([self isSingleLine:group]) {
        int maxrows = [[group bookInfos] count];
        if ([group style] == BookStoreTableViewCellStyleFour) {
            return MIN(2, maxrows);
        }
        return MIN(1, maxrows);
    }
    return [[group bookInfos] count];
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
    switch (group.style) {
        case BookStoreTableViewCellStyleOne:    return 132; break;
        case BookStoreTableViewCellStyleTwo:    return 80;  break;
        case BookStoreTableViewCellStyleThree:  return 153; break;
        case BookStoreTableViewCellStyleFour:
            if (indexPath.row == 0) return 112;
            else return 153;
            break;
        default: return 80; break;
    }
    return 0;
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
    NSString *bookCellStyle = [NSString stringWithFormat:@"BookStoreTableViewCellStyle%d", [group style]];
    if ([self isSingleLine:group]) {
        if ([group style] == 4) {
            if (indexPath.row == 0) {
                viewCell = [tableView dequeueReusableCellWithIdentifier:bookCellStyle];
            }
            else {
                viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookStoreTableViewCellStyle3"];
            }
            [viewCell setData:group];
        }
        else {
            viewCell = [tableView dequeueReusableCellWithIdentifier:bookCellStyle];
            [viewCell setData:group];
        }
    }
    else {
        viewCell = [tableView dequeueReusableCellWithIdentifier:bookCellStyle];
        [viewCell setData:[[group bookInfos] objectAtIndex:indexPath.row]];
    }
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 || indexPath.section == 1) {
        
        [self.navigationController pushViewControllerWithIdentifier:@"BookReaderViewController" animated:YES];
    }
    {
        BookInfoGroup *group = [[_bookStoreHome bookInfoGroups] objectAtIndex:indexPath.section];
        [self.navigationController pushViewControllerWithIdentifier:@"BookShelfViewController" completion:^(UIViewController *viewController) {
            BookShelfViewController *bookShelfView = (BookShelfViewController *)viewController;
            [bookShelfView setData:group];
        } animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
