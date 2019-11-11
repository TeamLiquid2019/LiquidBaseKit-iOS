//
//  TLViewController.m
//  LiquidBaseKit
//
//  Created by daxiangwork on 11/08/2019.
//  Copyright (c) 2019 daxiangwork. All rights reserved.
//

#import "TLViewController.h"

#import <LiquidBaseKit/TLUtil.h>
#import <LiquidBaseKit/TLNetworking.h>
#import "News.h"

@interface TLViewController ()

@end

@implementation TLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *uuid = [TLUtil getUUIDString];
    NSLog(@"%@",uuid);
    
    [[TLNetworking sharedInstance] getWithUrl:@"http://t.weather.sojson.com/api/weather/city/101030100" params:nil cache:NO progressBlock:nil successBlock:^(id response) {
        NSLog(@"%@",response);
    } failBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    [[TLNetworking sharedInstance] postWithUrl:@"https://www.sojson.com/open/api/lunar/json.shtml" params:nil cache:NO progressBlock:^(int64_t bytesRead, int64_t totalBytes) {
        NSLog(@"-----");
    } successBlock:^(id  _Nonnull response) {
        NSLog(@"%@",response);
    } failBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    News *new1 = [[News alloc] init];
    new1.newsId = 100;
    new1.title = @"100news";
    new1.subTitle = @"100subtitle";
    new1.content = @"是不是很牛逼不知道";
    new1.time = 20191110102399;
    
    
    
    News *new2 = [[News alloc] init];
    new2.newsId = 200;
    new2.title = @"200news";
    new2.subTitle = @"200subtitle";
    new2.content = @"是不是很牛逼不知道";
    new2.time = 20191110102499;
    
    
    [new1 bg_save];
    [new2 bg_save];
    
    NSLog(@"%@",NSHomeDirectory());
    
    News *new3 = [[News alloc] init];
    new3.newsId = 200;
    new3.title = @"300news";
    new3.subTitle = nil;
    new3.content = @"我是更新的数据";
    new3.time = 20191110102599;
    
    [new3 bg_saveOrUpdate];
    
    News *new4 = [[News alloc] init];
    new4.newsId = 300;
    new4.title = @"400news";
    new4.subTitle = nil;
    new4.content = @"";
    new4.time = 20191110102599;
    
    [new4 bg_saveOrUpdate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
