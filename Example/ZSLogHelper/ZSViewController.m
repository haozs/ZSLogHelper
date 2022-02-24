//
//  ZSViewController.m
//  ZSLogHelper
//
//  Created by elite_members@163.com on 02/24/2022.
//  Copyright (c) 2022 elite_members@163.com. All rights reserved.
//

#import "ZSViewController.h"

@interface ZSViewController ()

@end

@implementation ZSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"测试" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 150, 100, 100);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonClick
{
    NSLog(@"Ceshi");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
