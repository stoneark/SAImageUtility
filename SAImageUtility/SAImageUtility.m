//
//  SAImageUtility.m
//  SAImageUtility
//
//  Created by StoneArk on 14-3-27.
//  Copyright (c) 2014年 StoneArk. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "SAImageUtility.h"

@implementation SAImageUtility

+ (UIImage*)ellipseImage:(UIImage*)image
{
    return [self ellipseImage:image withInset:0];
}

+ (UIImage*)ellipseImage:(UIImage*)image withInset:(CGFloat)inset
{
    return [self ellipseImage:image withInset:inset borderWidth:0 borderColor:[UIColor clearColor]];
}

+ (UIImage*)ellipseImage:(UIImage*)image withInset:(CGFloat)inset borderWidth:(CGFloat)width borderColor:(UIColor*)color
{
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f , image.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    [image drawInRect:rect];
    
    if (width > 0)
    {
        CGContextSetStrokeColorWithColor(context, color.CGColor);
        CGContextSetLineCap(context,kCGLineCapButt);
        CGContextSetLineWidth(context, width);
        CGContextAddEllipseInRect(context, CGRectMake(inset + width/2, inset +  width/2, image.size.width - width- inset * 2.0f, image.size.height - width - inset * 2.0f));
        CGContextStrokePath(context);
    }
    
    UIImage *imgEllipsed = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgEllipsed;
}

+ (UIImage*)scaleImage:(UIImage*)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *imgScaled = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgScaled;
}

+ (UIImage*)scaleImage:(UIImage*)image toExactPixelSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 1.0);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *imgScaled = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgScaled;
}

+ (UIImage*)imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage*)imageWithImage:(UIImage *)image changeCanvasSize:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawAtPoint:CGPointMake((newSize.width-image.size.width)/2, (newSize.height-image.size.height)/2)];
    UIImage *imgReCanvas = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgReCanvas;
}

+ (UIImage*)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage*)addPointToImage:(UIImage*)image pointColor:(UIColor*)color pointRadius:(CGFloat)radius
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [image drawAtPoint:CGPointZero];
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextAddArc(context, image.size.width - radius, radius, radius, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathFill);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage*)serrateImage:(UIImage*)image withDensityLeft:(CGFloat)densityLeft right:(CGFloat)densityRight top:(CGFloat)densityTop bottom:(CGFloat)densityBottom
{
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint cursor = CGPointZero;
    CGContextMoveToPoint(context, 0, 0);
    
    // From left-top to left-bottom.
    if (densityLeft > 0)
    {
        CGFloat innerLeftX = sqrt(3) / 2 * densityLeft;
        while (cursor.y <= image.size.height)
        {
            CGContextAddLineToPoint(context, cursor.x, cursor.y);
            if (cursor.x == 0)
            {
                cursor.x = innerLeftX;
            }
            else
            {
                cursor.x = 0;
            }
            cursor.y += densityLeft;
        }
    }
    
    cursor.x = 0;
    cursor.y = image.size.height;
    CGContextAddLineToPoint(context, cursor.x, cursor.y);
    
    // From left-bottom to right-bottom.
    if (densityBottom > 0)
    {
        CGFloat innerBottomY = image.size.height - sqrt(3) / 2 * densityBottom;
        while (cursor.x <= image.size.width)
        {
            CGContextAddLineToPoint(context, cursor.x, cursor.y);
            if (cursor.y == image.size.height)
            {
                cursor.y = innerBottomY;
            }
            else
            {
                cursor.y = image.size.height;
            }
            cursor.x += densityBottom;
        }
    }
    
    cursor.x = image.size.width;
    cursor.y = image.size.height;
    CGContextAddLineToPoint(context, cursor.x, cursor.y);
    
    // From right-bottom to right-top.
    if (densityRight > 0)
    {
        CGFloat innerRightX = image.size.width - sqrt(3) / 2 * densityRight;
        while (cursor.y >= 0)
        {
            CGContextAddLineToPoint(context, cursor.x, cursor.y);
            if (cursor.x == image.size.width)
            {
                cursor.x = innerRightX;
            }
            else
            {
                cursor.x = image.size.width;
            }
            cursor.y -= densityRight;
        }
    }
    
    cursor.x = image.size.width;
    cursor.y = 0;
    CGContextAddLineToPoint(context, cursor.x, cursor.y);
    
    // From right-top to left-top.
    if (densityTop > 0)
    {
        CGFloat innerTopY = sqrt(3) / 2 * densityTop;
        while (cursor.x >= 0)
        {
            CGContextAddLineToPoint(context, cursor.x, cursor.y);
            if (cursor.y == 0)
            {
                cursor.y = innerTopY;
            }
            else
            {
                cursor.y = 0;
            }
            cursor.x -= densityTop;
        }
    }
    
    CGContextAddLineToPoint(context, 0, 0);
    CGContextClip(context);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    UIImage *imgSerrated = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgSerrated;
}
@end
