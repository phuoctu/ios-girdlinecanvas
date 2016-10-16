//
//  ViewController.m
//  GridlineDrawer
//
//  Created by Phuoc Tu on 10/13/16.
//  Copyright © 2016 phuoctu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"
#import "PixelDrawView.h"
#import "Constant.h"

@interface MyViewController ()

@end

@implementation MyViewController{
    PixelDrawView *pixelDrawView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    /*UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    label.text=@"This is test";
    [self.view addSubview:label];*/
    
    CGSize parentSize=[self.view bounds].size;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, parentSize.width, parentSize.height)];
    scrollView.backgroundColor = [UIColor blackColor];
    scrollView.delegate = self;
    scrollView.bounces = NO;
    
    
    pixelDrawView=[[PixelDrawView alloc] initWithFrame:CGRectMake(0, 0, parentSize.width, parentSize.height) size:SIZE_32];
    
    scrollView.contentSize = pixelDrawView.frame.size;
    [scrollView addSubview:pixelDrawView];
    scrollView.minimumZoomScale=1;
    scrollView.maximumZoomScale=10;
    [scrollView setZoomScale:scrollView.minimumZoomScale];
    
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return pixelDrawView;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"Did end decelerating");
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //    NSLog(@"Did scroll");
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    NSLog(@"Did end dragging");
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"Did begin decelerating");
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"Did begin dragging");
}


@end
