//
//  SAImageUtility.h
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

#import <Foundation/Foundation.h>

@interface SAImageUtility : NSObject

// Ellipse the image with no border.
+ (UIImage*)ellipseImage:(UIImage*)image withInset:(CGFloat)inset;

// Ellipse the image with border.
+ (UIImage*)ellipseImage:(UIImage*)image withInset:(CGFloat)inset withBorderWidth:(CGFloat)width withBorderColor:(UIColor*)color;

// Resize the image, and use the current device's pixel scaling factor (for retina resolution).
+ (UIImage*)scaleImage:(UIImage*)image toSize:(CGSize)size;

// Resize the image with an exact pixel size.
+ (UIImage*)scaleImage:(UIImage*)image toExactPixelSize:(CGSize)size;

// Use a kind of color to build an UIImage.
+ (UIImage*)imageWithColor:(UIColor*)color;

// Resize the canvas of the image, if the canvas size is greater than the image size, place the image in the center of the canvas.
+ (UIImage*)imageWithImage:(UIImage *)image changeCanvasSize:(CGSize)newSize;

// Capture a view to an image.
+ (UIImage*)imageWithView:(UIView *)view;

@end
