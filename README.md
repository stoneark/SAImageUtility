# SAImageUtility

SAImageUtility offers several useful and simple methods about UIImage.

## Features

- Ellipse an image, support adding inset and border.

```
+ (UIImage*)ellipseImage:(UIImage*)image;
+ (UIImage*)ellipseImage:(UIImage*)image withInset:(CGFloat)inset;
+ (UIImage*)ellipseImage:(UIImage*)image withInset:(CGFloat)inset borderWidth:(CGFloat)width borderColor:(UIColor*)color;
```

- Scale an image, support size in point and in pixel.

```
+ (UIImage*)scaleImage:(UIImage*)image toSize:(CGSize)size;
+ (UIImage*)scaleImage:(UIImage*)image toExactPixelSize:(CGSize)size;
```

- Change canvas size of an image.

```
+ (UIImage*)imageWithImage:(UIImage *)image changeCanvasSize:(CGSize)newSize;
```

- Get an image with a kind of color.

```
+ (UIImage*)imageWithColor:(UIColor*)color;
```

- Capture a view to an image.

```
+ (UIImage*)imageWithView:(UIView *)view;
```


## License

MIT License

@StoneArk