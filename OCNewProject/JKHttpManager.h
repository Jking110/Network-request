//
//  JKHttpManager.h
//  OCNewProject
//
//  Created by JK on 15/12/7.
//  Copyright © 2015年 JackKing. All rights reserved.
//

#import <Foundation/Foundation.h>

//下载请求的管理类(管理所有的下载任务)
//每一个下载任务(JKHttpRequest对象)
@interface JKHttpManager : NSObject
{
    //保存所有下载任务对象的可变字典
    //key为请求的接口地址，value为QFHttpRequest对象
    NSMutableDictionary * _taskDict;
}

+(JKHttpManager *)sharedManager;
//添加一个请求任务
//参数分别为请求的地址，代理(回调)对象和回调方法
-(void)addTask:(NSString*)httpUrl delegate:(id)delegate selector:(SEL)selector;
//删除指定的任务(已完成)
-(void)removeTask:(NSString*)httpUrl;
//停止正在请求中的任务
-(void)stopTask:(NSString*)httpUrl;
//停止某个窗口的所有请求任务
-(void)stopAllTask:(NSArray *)taskArray;
@end
