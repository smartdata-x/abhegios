//
//  BookStoreTableViewCellStyle4.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookStoreTableViewCellStyle4.h"
#import "BookInfo.h"
#import "BookInfoGroup.h"

@implementation BookStoreTableViewCellStyle4

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
    BookInfoGroup *bookInfoGroup = data;
    int count = [[bookInfoGroup bookInfos] count];
    for (int i=0; i<count; i++) {
        BookInfo *bookInfo = [[bookInfoGroup bookInfos] objectAtIndex:i];
        switch (i) {
            case 0:
                [_name setText:bookInfo.name];
                [_summary setText:bookInfo.summary];
                break;
            case 1: [_name1 setText:bookInfo.name]; break;
            case 2: [_name2 setText:bookInfo.name]; break;
            case 3: [_name3 setText:bookInfo.name]; break;
                
            default:
                break;
        }
    }
}

@end
