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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
