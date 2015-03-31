//
//  MovieDetailTableViewCellStyle1.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieDetailTableViewCellStyle1.h"
#import "GroupInfo.h"
#import "MovieDetailInfo.h"

@implementation MovieDetailTableViewCellStyle1

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
    MovieDetail *detail = data;
    if (detail) {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.frame];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[detail url]]];
        [webView loadRequest:request];
        [self addSubview:webView];
    }
}

@end
