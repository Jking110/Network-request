//
//  NSDictionary+Log.m
//  OCNewProject
//
//  Created by JK on 15/12/26.
//  Copyright (c) 2015年 JackKing. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)
//重写NSDictionary方法 解决打印乱码
- (NSString *)descriptionWithLocale:(id)locale
{
       NSArray *allKeys = [self allKeys];
       NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"{\t\n "];
         for (NSString *key in allKeys) {
                 id value= self[key];
                 [str appendFormat:@"\t \"%@\" = %@,\n",key, value];
             }
         [str appendString:@"}"];
    
         return str;
     }
@end
