//
//  Request.m
//  g
//
//  Created by JK on 15/12/9.
//  Copyright (c) 2015年 JackKing. All rights reserved.
//

#import "JKHttpBlockRequest.h"

@implementation JKHttpBlockRequest
-(id)initWithUrlStr:(NSString *)urlStr Block:(void (^)(BOOL,JKHttpBlockRequest*))request{
    if (self=[super init]) {
        //设置代理
        self.JKHttpBlockRequest=request;
        //开始请求
        [self httpRequest:urlStr];
        
        
    }
    return self;
    
}
-(void)httpRequest:(NSString*)urlStr{
    if (urlStr.length==0) {
        
        if (self.JKHttpBlockRequest) {
            self.JKHttpBlockRequest(NO,self);
        }
        
       
        return;
    }
     self.connection=[NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]] delegate:self];
}
//代理方法4个
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.data=[[NSMutableData alloc]init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    [self.data appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    //判断代理方法有没有实现
     [self jsonValue];
    if (self.JKHttpBlockRequest) {
        self.JKHttpBlockRequest(YES,self);
    }
    self.connection=nil;
   
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (self.JKHttpBlockRequest) {
        self.JKHttpBlockRequest(NO,self);
    }
    self.connection=nil;
   
}

//解析JSON
-(void)jsonValue{
    id result=[NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:nil];
    if ([result isKindOfClass:[NSDictionary class]]) {
        //字典
        self.dataDic=result;
    }else{
        if ([result isKindOfClass:[NSArray class]]) {
            self.dataArray=result;
        }
    }
    
    
    
    
}
@end

