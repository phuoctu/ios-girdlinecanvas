//
//  ViewController.m
//  GridlineDrawer
//
//  Created by Phuoc Tu on 10/13/16.
//  Copyright © 2016 phuoctu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    label.text=@"This is test";
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
