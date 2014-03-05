//
//  EGRichLabel.m
//  TTTTT
//
//  Created by 张伊辉 on 14-3-5.
//  Copyright (c) 2014年 yihui. All rights reserved.
//

#import "EGRichLabel.h"

@implementation EGRichLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setData:(NSMutableArray *)data{
    
    _data = data;
    
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    for (int i = 0; i<_data.count; i++) {
        
        TextObject *obj = [_data objectAtIndex:i];
        if (obj.type == faceText) {
            
            [obj.faceImage drawInRect:CGRectFromString([obj.arrayFrame objectAtIndex:0])];
            
        }else{
            
        }
    }
    
    // Drawing code
}


@end
