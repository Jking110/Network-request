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
#import "JKHttpBlockRequest.h"
#import "AppModel.h"
#import "NSDictionary+Log.h"
#define  PATH @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%d"
#define  PAGE 1
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //使用block请求数据时请调用此方法
    //[self loadData];
    
    // 使用代理请求数据时请调用此方法
    NSString *httpUrl = [NSString stringWithFormat:PATH,PAGE];
    [self addTask:httpUrl selector:@selector(requestFinished:)];

    
    UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    label.text = @"解析结果会在控制台上打印!";
    label.textAlignment = 1;
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:25];
    
    [self.view addSubview:label];
    
}
//网络数据请求
-(void)requestFinished:(JKHttpRequest *)hr{
    
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:hr.downloadData options:NSJSONReadingMutableContainers error:nil];
    
    if (dict) {
        NSLog(@"开始解析");
        NSArray *appArray = [dict objectForKey:@"applications"];
        for(NSDictionary *appDict in appArray){
            AppModel * model = [[AppModel alloc] init];
            //用KVC方式对模型对象赋值
            [model setValuesForKeysWithDictionary:appDict];
            //保存解析的模型对象
            [_dataArray addObject:model];
            NSLog(@"%@",appArray);
     
        }
        //移除已完成任务
        [[ JKHttpManager sharedManager] removeTask:hr.httpUrl];
        //创建plist文件在沙盒目录
            // 1.获得沙盒根路径
            NSString *home = NSHomeDirectory();
            NSLog(@"%@",home);
            // 2.document路径
            NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
            NSString *filepath = [docPath stringByAppendingPathComponent:@"data.plist"];
            
            BOOL tag = [appArray writeToFile:filepath atomically:YES];
            if (tag) {
                NSLog(@"创建在本地沙盒目录!");
            }else{
                NSLog(@"不能创建本地沙盒目录!");
            }
    }
    
        
}
//block网络数据请求
//-(void)loadData{
//  
//    NSString*nowUrlStr=[NSString stringWithFormat:PATH,PAGE];
//    //对整个连接进行一次中文处理
//    nowUrlStr=[nowUrlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    JKHttpBlockRequest *block=[[JKHttpBlockRequest alloc]initWithUrlStr:nowUrlStr Block:^(BOOL isFinish,JKHttpBlockRequest *http) {
//        //数据建模
//        
//        if (isFinish) {
//            
//           
//                NSLog(@"开始解析");
//                NSArray * temp=[http.dataDic objectForKey:@"applications"];
//                NSMutableArray * array=[NSMutableArray arrayWithCapacity:0];
//                for (NSDictionary * dic in temp) {
//                   AppModel * model=[[AppModel alloc]init];
//                    //使用kvc批量赋值模式
//                    [model setValuesForKeysWithDictionary:dic];
//                    
//                    //需要一个可变的数组来进行追加
//                    [array addObject:model];
//                    NSLog(@"%@",temp);
//                }
//            
//                //创建plist文件在沙盒目录
//                // 1.获得沙盒根路径
//                NSString *home = NSHomeDirectory();
//                NSLog(@"%@",home);
//                // 2.document路径
//                NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
//                NSString *filepath = [docPath stringByAppendingPathComponent:@"data.plist"];
//
//                BOOL tag = [temp writeToFile:filepath atomically:YES];
//                if (tag) {
//                    NSLog(@"创建在本地沙盒目录!");
//                }else{
//                    NSLog(@"不能创建本地沙盒目录!");
//                }
//
//        }
//
//    }];
//
//}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
