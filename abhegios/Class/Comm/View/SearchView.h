//
//  SearchView.h
//  abhegios
//
//  Created by 180 on 15/2/4.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <OEZCommSDK/OEZCommSDK.h>

@interface SearchView : OEZNibView<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

-(void) resignFirstResponder;
@end