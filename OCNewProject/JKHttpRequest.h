//
//  JKHttpRequest.h
//  OCNewProject
//
//  Created by JK on 15/12/7.
//  Copyright © 2015年 JackKing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKHttpRequest : NSObject<NSURLConnectionDataDelegate>
{
    //系统http请求类对象
    NSURLConnection * _httpConnection;
}
//下载的结果
@property (nonatomic,strong) NSMutableData * downloadData;
//代理对象（处理数据的对象）
@property (nonatomic,assign) id delegate;
//代理对象的某一个方法
@property (nonatomic,assign) SEL method;
//服务器的接口地址(数据下载地址)
@property (nonatomic,copy) NSString * httpUrl;
//开始从指定网址获得数据
-(void)requestFromUrl;
//停止请求
-(void)stopRequest;
@end
