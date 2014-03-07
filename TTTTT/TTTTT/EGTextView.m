//
//  EGTextView.m
//  TTTTT
//
//  Created by 张伊辉 on 14-3-7.
//  Copyright (c) 2014年 yihui. All rights reserved.
//

#import "EGTextView.h"

@implementation EGTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.delegate = self;

        lblPhd = [[UILabel alloc]initWithFrame:CGRectZero];
        lblPhd.backgroundColor = [UIColor clearColor];
        lblPhd.tag = 1;
        lblPhd.textAlignment = NSTextAlignmentLeft;
        [self addSubview:lblPhd];
        
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        

        self.delegate = self;
        lblPhd = [[UILabel alloc]initWithFrame:CGRectZero];
        lblPhd.backgroundColor = [UIColor clearColor];
        lblPhd.tag = 1;
        lblPhd.textAlignment = NSTextAlignmentLeft;
        [self addSubview:lblPhd];
        
    }
    return self;
}
-(void)setPlaceholder:(NSString *)string{
    
    lblPhd.frame = CGRectMake(5, 2, self.frame.size.width-10, 25);
    lblPhd.font = self.font;
    lblPhd.text = string;
    lblPhd.textColor = [UIColor lightGrayColor];
    lblPhd.alpha = 0.9;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
