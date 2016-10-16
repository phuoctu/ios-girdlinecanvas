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
    int initEdgePadding;
    CGRect drawerRect;
    int cellSize;
    NSMutableArray *data;
    float scale;
    CGSize originSize;
    CGFloat lastScale;
    CGPoint lastPoint;
}

+(Class)layerClass
{
    return [CATiledLayer class];
}

- (void)drawRect:(CGRect)rect
{
    
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context
{
    NSLog(@"%f %f", self.frame.origin.x, self.frame.origin.y);
    //CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextFillRect(context, self.bounds);
    
    CGSize viewSize=[self bounds].size;
    int drawerSize=viewSize.width-2*initEdgePadding;
    cellSize=drawerSize/self.size;
    drawerSize=cellSize*self.size;
    drawerRect=CGRectMake((viewSize.width-drawerSize)/2, (viewSize.height-drawerSize)/2, drawerSize, drawerSize);
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, drawerRect);
    
    //draw lines
    CGContextSetLineWidth(context, 0.5f);
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    //draw rows
    for (int i=0; i<self.size; i++) {
        CGContextMoveToPoint(context, drawerRect.origin.x, drawerRect.origin.y + i*cellSize);
        CGContextAddLineToPoint(context, drawerRect.origin.x + drawerRect.size.width, drawerRect.origin.y + i*cellSize);
        CGContextStrokePath(context);
    }
    
    //draw cols
    for (int i=0; i<self.size; i++) {
        CGContextMoveToPoint(context, drawerRect.origin.x + i*cellSize, drawerRect.origin.y);
        CGContextAddLineToPoint(context, drawerRect.origin.x+ i*cellSize, drawerRect.origin.y + drawerRect.size.height);
        CGContextStrokePath(context);
    }
    
    if(self.size > 8){
        CGContextSetLineWidth(context, 1.0f);
        int i=8;
        do{
            //draw bold row line
            CGContextMoveToPoint(context, drawerRect.origin.x, drawerRect.origin.y + i*cellSize);
            CGContextAddLineToPoint(context, drawerRect.origin.x + drawerRect.size.width, drawerRect.origin.y + i*cellSize);
            CGContextStrokePath(context);
            
            //draw bold col line
            CGContextMoveToPoint(context, drawerRect.origin.x + i*cellSize, drawerRect.origin.y);
            CGContextAddLineToPoint(context, drawerRect.origin.x+ i*cellSize, drawerRect.origin.y + drawerRect.size.height);
            CGContextStrokePath(context);
            i+=8;
        }while(i<self.size);
    }

}

- (instancetype) initWithFrame:(CGRect)frame
                          size:(int)size
                         color:(UIColor *)color
              gridLinesVisible:(bool)isVisible
{
    self=[self initWithFrame:frame];
    
    if(self) {
        CATiledLayer *tempTiledLayer = (CATiledLayer*)self.layer;
        tempTiledLayer.levelsOfDetail = 5;
        tempTiledLayer.levelsOfDetailBias = 2;
        self.opaque=YES;
    }
    
    self.size=size;
    self.color=color;
    
    [self initData];
    self.isGridLinesVisible=isVisible;
    
    [self initDrawSetting];
    
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

- (void) initDrawSetting
{
    initEdgePadding=0;
    scale=1.0f;
    originSize=[self bounds].size;
}
@end
