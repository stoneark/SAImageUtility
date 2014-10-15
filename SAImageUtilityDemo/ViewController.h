//
//  ViewController.h
//  SAImageUtilityDemo
//
//  Created by StoneArk on 14-4-23.
//  Copyright (c) 2014年 StoneArk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
- (IBAction)btnEllipseClick:(UIButton *)sender;
- (IBAction)btnResetClick:(UIButton *)sender;
- (IBAction)btnScalePlusClick:(UIButton *)sender;
- (IBAction)btnColorClick:(UIButton *)sender;
- (IBAction)btnCanvasClick:(UIButton *)sender;
- (IBAction)btnViewClick:(UIButton *)sender;
- (IBAction)btnPointClick:(UIButton *)sender;
- (IBAction)btnSerrateClick:(UIButton *)sender;
@end
