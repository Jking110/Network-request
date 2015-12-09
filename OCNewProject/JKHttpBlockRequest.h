//
//  Request.h
//  g
//
//  Created by JK on 15/12/9.
//  Copyright (c) 2015年 JackKing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKHttpBlockRequest : NSObject<NSURLConnectionDataDelegate>
/*
 主要设计方向为下载类
 其中把解析完成的结果，都使用属性进行记录，方便外部调用
 主要采用异步的方式进行请求
 根据指针，可以进行相应的终止操作
 */
//解析的数组
@property(nonatomic,strong)NSMutableArray*dataArray;
//解析的字典
@property(nonatomic,strong)NSMutableDictionary*dataDic;

//下载的数据data
@property(nonatomic,strong)NSMutableData*data;
//请求的指针
@property(nonatomic,assign)NSURLConnection*connection;

//缓存设计保存的路径
@property(nonatomic,copy)NSString*path;

//添加一个block指针
@property(nonatomic,copy)void(^JKHttpBlockRequest)(BOOL isSucceed,JKHttpBlockRequest*);

-(id)initWithUrlStr:(NSString*)urlStr Block:(void(^)(BOOL,JKHttpBlockRequest*))request;




@end
