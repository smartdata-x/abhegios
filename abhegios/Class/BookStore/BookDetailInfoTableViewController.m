//
//  BookDetailInfoTableViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDetailInfoTableViewController.h"
#import "BookDetailInfoTableViewCellStyle1.h"
#import "BookDetailInfoTableViewCellStyle4.h"
#import "BookDetailInfoTableViewCellStyle5.h"
#import "GroupInfo.h"
#import "BookDetailInfo.h"
#import "BookReaderViewController.h"
#import "AppAPIHelper.h"

@interface BookDetailInfoTableViewController ()
{
    BookInfo *_bookInfo;
}
@end

@implementation BookDetailInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didRequest {
    [[[AppAPIHelper shared] getBookAPI] getBookDetails:_bookInfo.id delegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setData:(id)data {
    _bookInfo = data;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return BookDetailInfoSectionMAX;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == BookDetailInfoSectionTagInfo) {
        int labelCount = [[_tableViewData label] count];
        int rows = (int)ceilf((float)labelCount / 3.0);
        return rows;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == BookDetailInfoSectionTagInfo) {
        return 22;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case BookDetailInfoSectionHeaderCell:   return 132; break;
        //case BookDetailInfoSectionReadSave:     return 49; break;
        case BookDetailInfoSectionIntroduction: return 160; break;
        case BookDetailInfoSectionChapterInfo:  return 55; break;
        case BookDetailInfoSectionTagInfo:      return 60; break;
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
        [view setBackgroundColor:kUIColorWithRGB(0xffffffff)];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, CGRectGetWidth(self.tableView.frame)-20, 21)];
        [label setText:@"图书标签"];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [view addSubview:label];
    }
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    OEZTableViewCell *viewCell = nil;
    switch (indexPath.section) {
        case BookDetailInfoSectionHeaderCell:
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDetailInfoTableViewCellStyle0"];
            _bookInfo.summary = _bookInfo.author;
            if (_tableViewData) [viewCell setData:_bookInfo];
            break;
            
#if 0
        case BookDetailInfoSectionReadSave:
            {
                viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDetailInfoTableViewCellStyle1"];
                BookDetailInfoTableViewCellStyle1 *cellStyle1 = (BookDetailInfoTableViewCellStyle1 *)viewCell;
                [cellStyle1.saveShelf addTarget:self action:@selector(gotoBookShelf:) forControlEvents:UIControlEventTouchUpInside];
                [cellStyle1.freeRead addTarget:self action:@selector(gotoBookReader:) forControlEvents:UIControlEventTouchUpInside];
                if (_tableViewData) [viewCell setData:_tableViewData];
            }
            break;
#endif
            
        case BookDetailInfoSectionIntroduction:
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDetailInfoTableViewCellStyle2"];
            if (_tableViewData) [viewCell setData:_tableViewData];
            break;
            
        case BookDetailInfoSectionChapterInfo:
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDetailInfoTableViewCellStyle3"];
            [viewCell setData:_tableViewData];
            break;
            
        case BookDetailInfoSectionTagInfo:
            viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDetailInfoTableViewCellStyle4"];
            if (_tableViewData) {
               [(BookDetailInfoTableViewCellStyle4 *)viewCell setDataWithIndex:_tableViewData Index:indexPath.row];
            }
            break;
            
        case BookDetailInfoSectionReadDownload:
            {
                viewCell = [tableView dequeueReusableCellWithIdentifier:@"BookDetailInfoTableViewCellStyle5"];
                [viewCell setData:_tableViewData];
                BookDetailInfoTableViewCellStyle5 *styleView = (BookDetailInfoTableViewCellStyle5 *)viewCell;
                [styleView.freeRead.name addTarget:self action:@selector(gotoBookReader:) forControlEvents:UIControlEventTouchUpInside];
                [styleView.download.name addTarget:self action:@selector(gotoBookShelf:) forControlEvents:UIControlEventTouchUpInside];
            }
            break;
            
        default:
            break;
    }
    
    return viewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (IBAction)gotoBookShelf:(id)sender {
    [self.navigationController pushViewControllerWithIdentifier:@"BookShelfViewController" completion:^(UIViewController *viewController) {
    } animated:YES];
}

- (IBAction)gotoBookReader:(id)sender {
    [self.navigationController pushViewControllerWithIdentifier:@"BookReaderViewController" completion:^(UIViewController *viewController) {
        BookReaderViewController *readerview = (BookReaderViewController *)viewController;
        [readerview setData:nil];
    } animated:YES];
}

@end
