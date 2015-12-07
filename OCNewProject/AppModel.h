//
//  AppModel.h
//  OCNewProject
//
//  Created by JK on 15/12/7.
//  Copyright © 2015年 JackKing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootModel.h"
@interface AppModel : RootModel
//k v c
//键值编码
@property (nonatomic,copy) NSString * applicationId;//应用id
@property (nonatomic,copy) NSString * categoryId;//分类id
@property (nonatomic,copy) NSString * categoryName;//分类名
@property (nonatomic,copy) NSString * currentPrice;//当前价格
@property (nonatomic,copy) NSString * description;//应用描述
@property (nonatomic,copy) NSString * downloads;//下载次数
@property (nonatomic,copy) NSString * expireDatetime;//过期时间
@property (nonatomic,copy) NSString * favorites;//收藏次数
@property (nonatomic,copy) NSString * fileSize;//文件大小
@property (nonatomic,copy) NSString * iconUrl;//图片地址
@property (nonatomic,copy) NSString * ipa;
@property (nonatomic,copy) NSString * itunesUrl;//应用地址
@property (nonatomic,copy) NSString * lastPrice;//最后价格
@property (nonatomic,copy) NSString * name;//应用名称
@property (nonatomic,copy) NSString * priceTrend;//价格类型
@property (nonatomic,copy) NSString * ratingOverall;
@property (nonatomic,copy) NSString * releaseDate;//发布时间
@property (nonatomic,copy) NSString * releaseNotes;//更新说明

@property (nonatomic,copy) NSString * shares;//分享次数
@property (nonatomic,copy) NSString * starCurrent;//当前星级
@property (nonatomic,copy) NSString * starOverall;//
@property (nonatomic,copy) NSString * updateDate;//发布日期
@property (nonatomic,copy) NSString * version;//版本号
@property (nonatomic,copy) NSString * comment;
//保存的是收藏或下载等字符串
@property (nonatomic,copy) NSString * keyword;
@property (nonatomic,copy) NSString * discription;
@end
