//
//  JKHttpRequest.m
//  OCNewProject
//
//  Created by JK on 15/12/7.
//  Copyright © 2015年 JackKing. All rights reserved.
//

#import "JKHttpRequest.h"

@implementation JKHttpRequest
-(id)init
{
    if (self=[super init]) {
        //创建保存下载结果的对象NSMutableData
        _downloadData=[[NSMutableData alloc] init];
    }
    return self;
}
-(void)requestFromUrl
{
    //如果请求的地址字符串有中文或其它非法字符需要对网址进行编码，这里认为在传进来之前已经编码了
    //创建网址类对象
    NSURL * url=[NSURL URLWithString:self.httpUrl];
    //创建请求类对象
    NSURLRequest * request=[NSURLRequest requestWithURL:url];
    //用指定的请求对象创建连接对象
    //一但连接对象创建，它就开始启动新线程异步下载数据
    //异步:两个任务（或事情）同时进行
    //同步:两个任务（或事情）按顺序执行
    //所有和界面相关的操作在主线程中完成
    //所有耗时的操作应该在子线程中完成
    _httpConnection=[[NSURLConnection alloc]initWithRequest:request delegate:self];
}
//接收到服务器的回应
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //打印状态码
    
    //清除旧数据
    [self.downloadData setLength:0];
}
//接收到服务器发送的数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //保存每一次接收的数据
    [self.downloadData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"数据请求成功");
    if ([self.delegate respondsToSelector:self.method]) {
        [self.delegate performSelector:self.method withObject:self];
    }
}
//数据请求失败(网络有问题或网址错误)
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"数据请求失败:%@",error);
    //清除错误的数据
    [self.downloadData setLength:0];
    if ([self.delegate respondsToSelector:self.method]) {
        [self.delegate performSelector:self.method withObject:self];
    }
}
-(void)stopRequest
{
    //停止请求
    if (_httpConnection) {
        [_httpConnection cancel];
    }
    //清除代理
    self.delegate=nil;
}
@end

