//
//  NextViewController.m
//  TTTTT
//
//  Created by 张伊辉 on 14-3-4.
//  Copyright (c) 2014年 yihui. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    for (int i = 0; i<100; i++) {
        UIImage *minImage = [[UIImage imageNamed:@"slider_minimum"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        UIImage *maxImage = [[UIImage imageNamed:@"slider_maximum"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        UIImage *thumbImage = [UIImage imageNamed:@"thumb"];
        
        
        UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(0, 200, 100, 10)];
        slider.backgroundColor = [UIColor redColor];
        [slider setMaximumTrackImage:maxImage forState:UIControlStateNormal];
        [slider setMinimumTrackImage:minImage forState:UIControlStateNormal];
        [slider setThumbImage:thumbImage forState:UIControlStateNormal];
        [self.view addSubview:slider];
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
