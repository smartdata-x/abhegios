//
//  AppDetailsTableViewCellStyle4.m
//  abhegios
//
//  Created by 180 on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppDetailsTableViewCellStyle4.h"
#import "AppDetailsInfo.h"
@implementation AppDetailsTableViewCellStyle4

-(void) setData:(id)data
{
    [super setData:data];
    NSString* content = [NSString stringWithFormat:@"下载：%@次\n",@([data down])];
    content = [content stringByAppendingFormat:@"分类：游戏\n"];
    content = [content stringByAppendingFormat:@"时间：%@\n",[data ontime]];
    content = [content stringByAppendingFormat:@"语言：%@\n",[data lang] == 2 ? @"英文" : @"中文"];
    content = [content stringByAppendingFormat:@"开发商：%@\n",[data provider]];
    content = [content stringByAppendingFormat:@"兼容性：需求 IOS5.0以上\n"];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:content];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:10];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [content length])];
    
    [_contentText setAttributedText:attributedString];
    [_contentText setNumberOfLines:0];
}
@end
