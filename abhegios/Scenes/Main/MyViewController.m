//
//  MyViewController.m
//  abhegios
//
//  Created by 180 on 15/2/7.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MyViewController.h"
#import "UserHelper.h"
@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFooterView];
     
    // Do any additional setup after loading the view.
}

-(UIButton*) widthSubmit:(NSString*)title rect:(CGRect) rect color:(NSInteger)color
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:rect];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundColor:kUIColorWithRGB(color)];
    //[button setBackgroundColor:kUIColorWithRGB(color) forState:UIControlStateNormal];
    //[button setBackgroundColor:kUIColorWithRGBAlpha(color,0.5) forState:UIControlStateHighlighted];
    [button.layer setCornerRadius:5.0f];
    [button.layer setMasksToBounds:YES];
    return button;
    
}

-(UIButton*) widthSubmit:(NSString*)title x:(CGFloat) x y:(CGFloat) y color:(NSInteger)color
{
    return [self widthSubmit:title rect:CGRectMake(x, y, kMainScreenWidth-x*2, 40.0f) color:color];
}

-(void) setFooterView
{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 45.f)];
    view.backgroundColor = [UIColor clearColor];
    UIButton* button = [self widthSubmit:@"退出登录" x:10 y:5 color:0xec5a4b];
    [button addTarget:self action:@selector(didAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    [self.tableView setTableFooterView:view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction) didAction:(id)sender
{
    [[UserHelper shared] logout];
    [[[UIApplication sharedApplication].delegate window] setRootViewController:[[self storyboard] instantiateViewControllerWithIdentifier:@"MainLoginViewController"]];

}
@end
