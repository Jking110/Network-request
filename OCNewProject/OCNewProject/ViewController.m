//
//  ViewController.m
//  OCNewProject
//
//  Created by JK on 15/12/7.
//  Copyright (c) 2015年 JackKing. All rights reserved.
//

#import "ViewController.h"
#import "JKHttpRequest.h"
#import "JKHttpManager.h"
#import "AppModel.h"
#define  PATH @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%d"
#define  PAGE 1
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *httpUrl = [NSString stringWithFormat:PATH,PAGE];
    [self addTask:httpUrl selector:@selector(requestFinished:)];
    
    UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    label.text = @"解析结果会在控制台上打印!";
    label.textAlignment = 1;
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:14];
    
    [self.view addSubview:label];
    
}

-(void)requestFinished:(JKHttpRequest *)hr{
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:hr.downloadData options:NSJSONReadingMutableContainers error:nil];
    
    if (dict) {
        NSLog(@"开始解析");
        NSArray *appArray = [dict objectForKey:@"applications"];
        for(NSDictionary *appDict in appArray){
            AppModel * model = [[AppModel alloc] init];
            //用KVC方式对模型对象赋值
            [model setValuesForKeysWithDictionary:appDict];
            //保存解析的模型对象
            [_dataArray addObject:model];
            NSLog(@"%@",_dataArray);
        }
        //移除已完成任务
        [[ JKHttpManager sharedManager] removeTask:hr.httpUrl];
    }
    
    

    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
