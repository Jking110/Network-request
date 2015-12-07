//
//  RootViewController.h
//  OCNewProject
//
//  Created by JK on 15/12/7.
//  Copyright © 2015年 JackKing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
{
    //保存当前窗口发出的所有请求任务的地址
    NSMutableArray * taskUrlArray;
}
//添加一个请求任务,由当前对象来处理请求的结果数据
-(void)addTask:(NSString*)httpUrl selector:(SEL)selector;
@end
