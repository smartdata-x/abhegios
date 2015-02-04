//
//  SearchView.m
//  abhegios
//
//  Created by 180 on 15/2/4.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

-(void)  awakeFromNib
{
    [super awakeFromNib];
    [_searchTextField setDelegate:self];
    [_searchTextField setPlaceholder:@"搜索"];
    [_searchTextField setReturnKeyType:UIReturnKeySearch];
    //[_searchTextField setLeftView: [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]]];
    [_searchTextField setLeftViewMode:UITextFieldViewModeAlways];
}


-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"])
    {
        [self resignFirstResponder];
        return NO;
    }
    return YES;
}

-(void) resignFirstResponder
{
    [_searchTextField resignFirstResponder];
}
@end
