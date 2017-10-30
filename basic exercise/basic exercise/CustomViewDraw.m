//
//  CustomViewDraw.m
//  basic exercise
//
//  Created by cocoa on 2017/6/16.
//  Copyright © 2017年 wangbingyan. All rights reserved.
//

#import "CustomViewDraw.h"
#define ColorHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation CustomViewDraw

- (void)drawRect:(CGRect)rect {
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *aColor = ColorHEX(0x008866);
    
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    
    CGContextSetLineWidth(context, 1.0);//线的宽度
    CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
    
    CGFloat halfWidth = rect.size.width / 2;
    CGFloat halfHeight = rect.size.height / 2;
    
    CGContextAddArc(context, rect.origin.x + halfWidth, rect.origin.y + halfHeight,MIN(halfWidth, halfHeight) , 0, 2 * M_PI, 0); //添加一个圆

    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充
}

@end
