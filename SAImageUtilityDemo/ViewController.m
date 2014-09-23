//
//  ViewController.m
//  SAImageUtilityDemo
//
//  Created by StoneArk on 14-4-23.
//  Copyright (c) 2014年 StoneArk. All rights reserved.
//

#import "ViewController.h"
#import "SAImageUtility.h"

@interface ViewController ()
@property (strong,nonatomic) UIImage *imgSource;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_imgView.layer setBorderWidth:1];
    [_imgView.layer setBorderColor:[UIColor blackColor].CGColor];
    [_imgView setClipsToBounds:YES];
    _imgSource = [UIImage imageNamed:@"image.jpeg"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnEllipseClick:(UIButton *)sender
{
    UIImage *img = [SAImageUtility ellipseImage:_imgSource];
    [_imgView setImage:img];
    [_imgView setContentMode:UIViewContentModeCenter];
}

- (IBAction)btnResetClick:(UIButton *)sender
{
    [_imgView setImage:_imgSource];
    [_imgView setContentMode:UIViewContentModeCenter];
}

- (IBAction)btnScalePlusClick:(UIButton *)sender
{
    UIImage *img = [SAImageUtility scaleImage:_imgSource toSize:CGSizeMake(300, 300)];
    [_imgView setImage:img];
    [_imgView setContentMode:UIViewContentModeCenter];
}

- (IBAction)btnColorClick:(UIButton *)sender
{
    UIImage *img = [SAImageUtility imageWithColor:[UIColor blueColor]];
    [_imgView setImage:img];
    [_imgView setContentMode:UIViewContentModeScaleToFill];
}

- (IBAction)btnCanvasClick:(UIButton *)sender
{
    UIImage *img = [SAImageUtility imageWithImage:_imgSource changeCanvasSize:CGSizeMake(400, 400)];
    [_imgView setImage:img];
    [_imgView setContentMode:UIViewContentModeScaleToFill];
}
- (IBAction)btnViewClick:(UIButton *)sender
{
    UIImage *img = [SAImageUtility imageWithView:self.view];
    [_imgView setImage:img];
    [_imgView setContentMode:UIViewContentModeScaleToFill];
}

- (IBAction)btnPointClick:(UIButton *)sender
{
    UIImage *img = [SAImageUtility addPointToImage:_imgSource pointColor:[UIColor redColor] pointRadius:6];
    [_imgView setImage:img];
    [_imgView setContentMode:UIViewContentModeCenter];
}
@end
