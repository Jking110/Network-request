//
//  NSArray+Log.m
//  OCNewProject
//
//  Created by JK on 15/12/26.
//  Copyright (c) 2015年 JackKing. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)
//重写NSArray方法 解决打印乱码
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString stringWithFormat:@"%lu (\n", (unsigned long)self.count];
    
    for (id obj in self) {
        [str appendFormat:@"\t%@, \n", obj];
    }
    
    [str appendString:@")"];
    
    return str;
}
@end
