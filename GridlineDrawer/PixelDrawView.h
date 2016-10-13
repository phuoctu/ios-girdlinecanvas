//
//  PixelDrawView.h
//  GridlineDrawer
//
//  Created by Phuoc Tu on 10/13/16.
//  Copyright © 2016 phuoctu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PixelDrawView : UIView

@property (nonatomic) int size;
@property (nonatomic) UIColor *color;
@property (nonatomic) bool isGridLinesVisible;

- (instancetype) initWithFrame:(CGRect)frame
                          size:(int)size
                         color:(UIColor *)color
              gridLinesVisible: (bool)isVisible;

- (instancetype) initWithFrame:(CGRect)frame
                          size:(int)size
                         color:(UIColor *)color;

- (instancetype) initWithFrame:(CGRect)frame
                          size:(int)size;

- (void) clear;

- (void) toggleGridLines;

@end
