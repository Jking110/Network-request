//
//  JKHttpManager.m
//  OCNewProject
//
//  Created by JK on 15/12/7.
//  Copyright © 2015年 JackKing. All rights reserved.
//

#import "JKHttpManager.h"
#import "JKHttpRequest.h"
@implementation JKHttpManager
+(JKHttpManager*)sharedManager
{
    static JKHttpManager * httpManager;
    if (!httpManager) {
        httpManager=[[JKHttpManager alloc] init];
    }
    return httpManager;
}
//自定义初始化方法，完成成员变量实例化
-(id)init
{
    if (self=[super init]) {
        _taskDict=[[NSMutableDictionary alloc] init];
    }
    return self;
}
-(void)addTask:(NSString *)httpUrl delegate:(id)delegate selector:(SEL)selector
{
    NSLog(@"httpurl:%@",httpUrl);
    //检查是否有指定的任务存在
    JKHttpRequest * hr=[_taskDict objectForKey:httpUrl];
    if (!hr) {
        //创建http请求对象
        hr=[[JKHttpRequest alloc] init];
        //设置相关参数
        hr.delegate=delegate;
        hr.method=selector;
        hr.httpUrl=httpUrl;
        //向服务器发出请求
        [hr requestFromUrl];
        //保存请求任务
        [_taskDict setObject:hr forKey:httpUrl];
    }
    else{
        NSLog(@"任务已存在:%@",httpUrl);
    }
}
//停止任务
-(void)stopTask:(NSString *)httpUrl
{
    JKHttpRequest * request=[_taskDict objectForKey:httpUrl];
    if (request) {
        
        [request stopRequest];
    }
}
//移除任务
-(void)removeTask:(NSString *)httpUrl
{
    [self stopTask:httpUrl];
    
    //移除指定的任务
    [_taskDict removeObjectForKey:httpUrl];
}
-(void)stopAllTask:(NSArray *)taskArray
{
    for (NSString * httpUrl in taskArray) {
        [self removeTask:httpUrl];
    }
}
@end
