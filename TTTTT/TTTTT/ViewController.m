//
//  ViewController.m
//  TTTTT
//
//  Created by 张伊辉 on 14-3-3.
//  Copyright (c) 2014年 yihui. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

#import "TextObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *string = @"我@章诒和 们到http://www.baidu.com底是为99999999什么呢？到底@张伊辉 是干什么呢？[微笑][微笑][微笑][微笑][微笑]索科特拉岛特有的龙血树 索科特拉岛（Socotra）距阿拉伯半岛350公里，是印度洋的一颗明珠，也有人叫它极乐岛。岛如其名，在岛上，人们";
    NSMutableArray *muArr =  [TextObject getTextObjectArrayFrom:string];
    NSLog(@"muArr is %@",muArr);
    
    for (int i = 0; i<muArr.count; i++) {
        
        
        
        TextObject *obj = [muArr objectAtIndex:i];
        NSLog(@"obj string %@",obj.string);
        NSLog(@"obj arrayFrame %@",obj.arrayFrame);
        NSLog(@"obj color %@",obj.color);
        NSLog(@"obj image %@",obj.faceImage);
        
        if (obj.arrayFrame.count == 1) {
            
            CGRect rect = CGRectFromString([obj.arrayFrame objectAtIndex:0]);

            if (obj.type == faceText) {
                
                UIImageView *imageview = [[UIImageView alloc]initWithFrame:rect];
                imageview.image = obj.faceImage;
                [self.view addSubview:imageview];
            }else{
                
                UILabel *lbl = [[UILabel alloc]initWithFrame:rect];
                lbl.backgroundColor = [UIColor clearColor];
                lbl.text = obj.string;
                lbl.font = [UIFont systemFontOfSize:15.0];
                lbl.textColor = obj.color;
                [self.view addSubview:lbl];
            }
        }
        
    }
    /*
    
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
//  [[UISlider appearance] setMaximumTrackImage:maxImage forState:UIControlStateNormal];
//  [[UISlider appearance] setMinimumTrackImage:minImage forState:UIControlStateNormal];
//  [[UISlider appearance] setThumbImage:thumbImage forState:UIControlStateNormal];

    
    NSString *strURL = @"http://www.baidu.com";
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        NSLog(@"strURL is %@",strURL);
        
    });
    
    */
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    NextViewController *_nextVc = [[NextViewController alloc]initWithNibName:@"NextViewController" bundle:nil];
    [self presentViewController:_nextVc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
