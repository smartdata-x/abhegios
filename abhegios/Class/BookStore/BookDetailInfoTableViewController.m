//
//  BookDetailInfoTableViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDetailInfoTableViewController.h"

@interface BookDetailInfoTableViewController ()

@end

@implementation BookDetailInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return BookDetailInfoSectionMAX;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == BookDetailInfoSectionTagInfo) {
        return 5;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (BookDetailInfoSectionTagInfo) {
        return 22;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case BookDetailInfoSectionHeaderCell:   return 132; break;
        case BookDetailInfoSectionReadSave:     return 49; break;
        case BookDetailInfoSectionIntroduction: return 100; break;
        case BookDetailInfoSectionChapterInfo:  return 47; break;
        case BookDetailInfoSectionTagInfo:      return 45; break;
        case BookDetailInfoSectionReadDownload: return 47; break;
        default:
            break;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    if( section == BookDetailInfoSectionTagInfo )
    {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 22)];
        [view setBackgroundColor:kUIColorWithRGB(0xf3f3f3)];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [label setText:@"图书标签"];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [view addSubview:label];
    }
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OEZTableViewCell *viewCell = nil;
    switch (indexPath.section) {
        case BookDetailInfoSectionHeaderCell:
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDetailInfoTableViewCellStyle0"];
            [viewCell setData:nil];
            break;
            
        case BookDetailInfoSectionReadSave:
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDetailInfoTableViewCellStyle1"];
            [viewCell setData:nil];
            break;
            
        case BookDetailInfoSectionIntroduction:
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDetailInfoTableViewCellStyle2"];
            [viewCell setData:nil];
            break;
            
        case BookDetailInfoSectionChapterInfo:
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDetailInfoTableViewCellStyle3"];
            [viewCell setData:nil];
            break;
            
        case BookDetailInfoSectionTagInfo:
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDetailInfoTableViewCellStyle4"];
            [viewCell setData:nil];
            break;
            
        case BookDetailInfoSectionReadDownload:
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDetailInfoTableViewCellStyle5"];
            [viewCell setData:nil];
            break;
            
        default:
            break;
    }
    
    return viewCell;
}

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
