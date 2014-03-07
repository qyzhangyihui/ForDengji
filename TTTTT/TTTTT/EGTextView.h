//
//  EGTextView.h
//  TTTTT
//
//  Created by 张伊辉 on 14-3-7.
//  Copyright (c) 2014年 yihui. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface EGTextView : UITextView<UITextViewDelegate>
{
    UILabel *lblPhd;
}
-(void)setPlaceholder:(NSString *)string;
@end
