//
//  PixelDrawView.m
//  GridlineDrawer
//
//  Created by Phuoc Tu on 10/13/16.
//  Copyright © 2016 phuoctu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PixelDrawView.h"

@implementation PixelDrawView{
    
    NSMutableArray *data;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithFrame:(CGRect)frame
                          size:(int)size
                         color:(UIColor *)color
              gridLinesVisible:(bool)isVisible
{
    self=[self initWithFrame:frame];
    
    self.size=size;
    self.color=color;
    
    [self initData];
    self.isGridLinesVisible=isVisible;
    
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame
                          size:(int)size
                         color:(UIColor *)color
{
    return [self initWithFrame:frame size:size color:color gridLinesVisible:true];
}

- (instancetype) initWithFrame:(CGRect)frame size:(int)size
{
    return [self initWithFrame:frame size:size color:[UIColor blackColor]];
}

- (void) clear
{
    [self initData];
}

- (void) toggleGridLines
{
    self.isGridLinesVisible=!self.isGridLinesVisible;
    if (self.isGridLinesVisible) {
        [self showGridLines];
    }else{
        [self hideGridLines];
    }
}

- (void) initData
{
    int total=self.size*self.size;
    data=[NSMutableArray arrayWithCapacity:total];
    
    for (int i=0; i<total; i++) {
        data[i]=[UIColor whiteColor];
    }
}

- (void) showGridLines
{
    
}

- (void) hideGridLines
{
    
}

@end
