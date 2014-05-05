//
//  ViewController.h
//  TTTTT
//
//  Created by 张伊辉 on 14-3-3.
//  Copyright (c) 2014年 yihui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGTextView.h"
@interface ViewController : UIViewController
{
    
}
@property (weak, nonatomic) IBOutlet UIView *toolbar;
@property (weak, nonatomic) IBOutlet UIImageView *inputImageView;
@property (weak, nonatomic) IBOutlet EGTextView *textView;

@end
