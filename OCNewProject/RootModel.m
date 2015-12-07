//
//  RootModel.m
//  OCNewProject
//
//  Created by JK on 15/12/7.
//  Copyright © 2015年 JackKing. All rights reserved.
//

#import "RootModel.h"

@implementation RootModel
//当用kvc给模型赋值时找不到指定的 key对应的属性时会调用此方法
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"forUndefinedKey:%@",key);
}
//当用kvc从模型取值时找不到指定的 key对应的属性时会调用此方法
-(id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"valueForUndefinedKey:%@",key);
    return nil;
}
@end
