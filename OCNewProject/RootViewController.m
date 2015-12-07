//
//  RootViewController.m
//  OCNewProject
//
//  Created by JK on 15/12/7.
//  Copyright © 2015年 JackKing. All rights reserved.
//

#import "RootViewController.h"
#import "JKHttpManager.h"
#import "JKHttpRequest.h"
@interface RootViewController ()

@end

@implementation RootViewController

-(void)addTask:(NSString *)httpUrl selector:(SEL)selector
{
    [[JKHttpManager sharedManager] addTask:httpUrl delegate:self selector:selector];
    
    //保存请求过的网址
    if (![taskUrlArray containsObject:httpUrl]) {
        [taskUrlArray addObject:httpUrl];
    }
}
-(void)dealloc
{
    NSLog(@"dealloc:%@",NSStringFromClass([self class]));
    //停止所有没有完成的任务
    [[JKHttpManager sharedManager] stopAllTask:taskUrlArray];
}
//子类需要重载此方法
-(void)requestFinished:(JKHttpRequest*)hr
{
    
}






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
