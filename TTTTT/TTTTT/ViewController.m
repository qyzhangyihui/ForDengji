//
//  ViewController.m
//  TTTTT
//
//  Created by 张伊辉 on 14-3-3.
//  Copyright (c) 2014年 yihui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    NSLog(@"abc");
    NSLog(@"ef");
    NSLog(@"kkkk");
    
    UIImage *minImage = [[UIImage imageNamed:@"slider_minimum"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    UIImage *maxImage = [[UIImage imageNamed:@"slider_maximum"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    UIImage *thumbImage = [UIImage imageNamed:@"thumb"];
    
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(0, 200, 100, 10)];
    slider.backgroundColor = [UIColor redColor];
    [slider setMaximumTrackImage:maxImage forState:UIControlStateNormal];
    [slider setMinimumTrackImage:minImage forState:UIControlStateNormal];
    [slider setThumbImage:thumbImage forState:UIControlStateNormal];
    [self.view addSubview:slider];
//    
//    [[UISlider appearance] setMaximumTrackImage:maxImage forState:UIControlStateNormal];
//    [[UISlider appearance] setMinimumTrackImage:minImage forState:UIControlStateNormal];
//    [[UISlider appearance] setThumbImage:thumbImage forState:UIControlStateNormal];

    
    NSString *strURL = @"http://www.baidu.com";
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        NSLog(@"strURL is %@",strURL);
        
    });
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
