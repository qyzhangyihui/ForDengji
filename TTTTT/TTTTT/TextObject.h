//
//  TextObject.h
//  TTTTT
//
//  Created by 张伊辉 on 14-3-5.
//  Copyright (c) 2014年 yihui. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES :NO)
#define tFont [UIFont systemFontOfSize:15.0]
typedef enum {
    
    generalText = 0,  //普通文本
    faceText = 1,     //表情文本
    attentionText = 2, //@人名
    specialText = 3,  //特殊文本，网址
    phoneText = 4, //电话之类的。
    
}TextType;

@interface TextObject : NSObject
{
}
@property(nonatomic,strong)NSString *string;
@property(nonatomic,strong)UIColor *color;
@property(nonatomic,strong)NSMutableArray *arrayFrame;
@property(nonatomic,assign)TextType type;
@property(nonatomic,strong)UIImage *faceImage;

+(NSMutableArray *)getTextObjectArrayFrom:(NSString *)string;

@end
