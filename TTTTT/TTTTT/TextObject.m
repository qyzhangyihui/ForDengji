//
//  TextObject.m
//  TTTTT
//
//  Created by 张伊辉 on 14-3-5.
//  Copyright (c) 2014年 yihui. All rights reserved.
//

#import "TextObject.h"

@implementation TextObject

+(NSMutableArray *)getTextObjectArrayFrom:(NSString *)string{
    
    NSMutableArray *muArr = [[NSMutableArray alloc]init];
    
    NSArray *words = [string componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    for (NSString *word in words) {
        
        if (![word isEqualToString:@""]) {
            
            [self handleSepcial:string regexison:[self getRgex] array:muArr];
        }
    }
    return muArr;
}


+(NSArray *)getFaceArray{
    
    NSArray *faceArray = [[NSArray alloc]initWithObjects:@"[微笑]",@"[撇嘴]",@"[色]",@"[发呆]",@"[得意]",@"[流泪]",@"[害羞]",@"[闭嘴]",@"[睡]",@"[大哭]",
                          @"[尴尬]",@"[发怒]",@"[调皮]",@"[龇牙]",@"[惊讶]",@"[难过]",@"[严肃]",@"[冷汗]",@"[抓狂]",@"[吐]",@"[偷笑]",@"[可爱]",@"[白眼]",@"[傲慢]",
                          @"[饥饿]",@"[困]",@"[惊恐]",@"[流汗]",@"[憨笑]",@"[大兵]",@"[奋斗]",@"[咒骂]",@"[疑问]",@"[嘘]",@"[晕]",@"[折磨]",@"[衰]",@"[骷髅]",
                          @"[敲打]",@"[再见]",@"[擦汗]",@"[抠鼻]",@"[鼓掌]",@"[糗大了]",@"[坏笑]",@"[左哼哼]",@"[右哼哼]",@"[哈欠]",@"[鄙视]",@"[委屈]",@"[快哭了]",
                          @"[阴险]",@"[亲嘴]",@"[吓]",@"[可怜]",@"[菜刀]",@"[西瓜]",@"[啤酒]",@"[篮球]",@"[乒乓]",@"[咖啡]",@"[饭]",@"[猪头]",@"[玫瑰]",@"[凋谢]",
                          @"[示爱]",@"[爱心]",@"[心碎]",@"[蛋糕]",@"[闪电]",@"[炸弹]",@"[刀]",@"[足球]",@"[瓢虫]",@"[便便]",@"[拥抱]",@"[月亮]",@"[太阳]",@"[礼物]",
                          @"[强]",@"[弱]",@"[握手]",@"[胜利]",@"[抱拳]",@"[勾引]",@"[拳头]",@"[差劲]",@"[爱你]",@"[NO]",@"[OK]",@"[苹果]",@"[可爱狗]",@"[小熊]",@"[彩虹]",@"[皇冠]",@"[钻石]",nil];
    return faceArray;
}

+(BOOL)isValidateRegularExpression:(NSString *)strDestination byExpression:(NSString *)strExpression

{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strExpression];
    
    return [predicate evaluateWithObject:strDestination];
    
}
//验证电话号码
+(BOOL)isValidateTelNumber:(NSString *)number {
    
    NSString *strRegex = @"(?:(?:\\+?\\d{2}\\s*)?)(?:\\d{11,12})|(?:(?:\\d{7,8})(?:-\\d{3,5})?|(?:\\d{4}|\\d{3})-(?:\\d{7,8})(?:-\\d{3,5})?)";
    
    BOOL rt = [self isValidateRegularExpression:number byExpression:strRegex];
    
    return rt;
    
}
//得到正则表达式
+(NSRegularExpression *)getRgex{
    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\])|((@|#)([A-Z0-9a-z(é|ë|ê|è|à|â|ä|á|ù|ü|û|ú|ì|ï|î|í)_]+))|(@|#)([\u4e00-\u9fa5]+)|(http(s)?://([A-Z0-9a-z._-]*(/)?)*)|(?:(?:\\+?\\d{2}\\s*)?)(?:\\d{11,12})|(?:(?:\\d{7,8})(?:-\\d{3,5})?|(?:\\d{4}|\\d{3})-(?:\\d{7,8})(?:-\\d{3,5})?)" options:NSRegularExpressionAnchorsMatchLines error:&error];
    
    return  regex;
}
//算法二，用正则
+(void)handleSepcial:(NSString *)word regexison:(NSRegularExpression *)regex array:(NSMutableArray *)array{
    
    
    
    NSTextCheckingResult *match = [regex firstMatchInString:word options:0 range:NSMakeRange(0, [word length])];
    
    if (match) {
        
        // Dissolve the word (for example a hashtag: #youtube!, we want only #youtube)
        NSString *preCharacters = [word substringToIndex:match.range.location];
        NSString *wordCharacters = [word substringWithRange:match.range];
        NSString *postCharacters = [word substringFromIndex:match.range.location + match.range.length];
        
        if (![preCharacters isEqualToString:@""]) {
            
            [array addObject:[self getTextObjectParseString:preCharacters]];
           // [array addObject:preCharacters];
        }
        if (![wordCharacters isEqualToString:@""]) {
            
            [array addObject:[self getTextObjectParseString:wordCharacters]];

            //[array addObject:wordCharacters];
        }
        
        if (![postCharacters isEqualToString:@""]) {
            
            [self handleSepcial:postCharacters regexison:regex array:array];
            
        }
    }else{
        
        
        [array addObject:[self getTextObjectParseString:word]];

       
        
    }
    
    
}
+(CGSize)getContentSize:(NSString *)content font:(UIFont *)pFont width:(CGFloat)pWidth{
    
    CGSize contentSize;
    if (IS_IOS7) {
        contentSize = [content boundingRectWithSize:CGSizeMake(pWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:pFont,NSFontAttributeName, nil] context:nil].size;
    }else{
        
        contentSize = [content sizeWithFont:pFont constrainedToSize:CGSizeMake(pWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    }
    return contentSize;
}
+(TextObject *)getTextObjectParseString:(NSString *)str{
    
    TextObject *textObj = [[TextObject alloc]init];
    textObj.string = str;
    NSMutableArray *arrframe = [NSMutableArray array];

    
    static float upX = 0;
    static float upY = 0;
    
    float _size = 18;
    float faceWidth = 18;
    float faceHeight = 18;
    float maxWidth = 270;
    
    
    int n = NSNotFound;
    
    if ([str hasPrefix:@"["]&&[str hasSuffix:@"]"]) {
        

        
        NSArray *faceArray = [self getFaceArray];
        n = [faceArray indexOfObject:str];
        
        if(n != NSNotFound){
            
           
            
            UIImage *img=[UIImage imageNamed:@"eagle0.png"];
            textObj.type = faceText;
            textObj.faceImage = img;
            
            
            if ((upX + faceWidth) > maxWidth) {
                upY = upY + _size;
                upX = 0;
                
                [arrframe addObject:NSStringFromCGRect(CGRectMake(upX, upY, faceWidth, faceHeight))];
                //如果要换行了，先计算，后重绘。
                //[img drawInRect:CGRectMake(upX, upY, faceWidth, faceHeight)];
                
                upX += faceHeight;
            }else {
                
                [arrframe addObject:NSStringFromCGRect(CGRectMake(upX, upY, faceWidth, faceHeight))];

                //先重绘，再计算
                //[img drawInRect:CGRectMake(upX, upY, faceWidth, faceHeight)];
                
                upX += faceWidth;
                
            }
        }
    }
    
    
    if(n == NSNotFound){
        
        if ([str hasPrefix:@"@"]) {
            
            textObj.type = attentionText;
            textObj.color = [UIColor redColor];
            
        }else if([str hasPrefix:@"http"]){
            
            textObj.color = [UIColor blueColor];
            textObj.type = specialText;
            
        }else if([self isValidateTelNumber:str]){
            
            textObj.color = [UIColor blueColor];
            textObj.type =  phoneText;
            
        }
        else{
            
            textObj.color = [UIColor blackColor];
            textObj.type = generalText;
            
        }
        
        float tempX = upX;
        float tempY = upY;
        
        for (int j = 0; j < [str length]; j++) {
            NSString *temp = [str substringWithRange:NSMakeRange(j, 1)];
            
            if([temp isEqualToString:@"\n"]){
                upY = upY + _size;
                upX = 0;
            }else{
                
                CGSize size = [self getContentSize:temp font:tFont width:_size];
                
                if ((upX+size.width) > maxWidth)
                {
                    upY = upY + size.height;
                    upX = 0;
                    
                    
                    //draw
                    upX += size.width;
                    
                    
                }else{
                    //draw
                    
                    
                    upX += size.width;
                }
                
            }
        }
        if (upY == tempY) {
            
            CGRect rect = CGRectMake(tempX, tempY, upX-tempX,_size);
            [arrframe addObject:NSStringFromCGRect(rect)];
                
                
        }else if(upY > tempY){
                
            CGRect rect1 = CGRectMake(tempX, tempY, maxWidth-tempX, _size);
            [arrframe addObject:NSStringFromCGRect(rect1)];
                
            CGRect rect2;
            float middleY = (upY-tempY-_size>0)?(upY-tempY-_size):0;
            rect2 = CGRectMake(0, tempY+_size, maxWidth,middleY);
            [arrframe addObject:NSStringFromCGRect(rect2)];
                
            CGRect rect3 = CGRectMake(0, upY, upX, _size);
            [arrframe addObject:NSStringFromCGRect(rect3)];
            
        }
    }
    
    textObj.arrayFrame = arrframe;
    return textObj;
}

@end
