//
//  EEResponse.m
//  MotoBand2019
//
//  Created by Eric on 2019/4/15.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "EEResponse.h"

#import <YYKit/NSObject+YYModel.h>

@interface EEResponse ()

@property(nonatomic,copy,readwrite)NSString *code;//返回成功或者失败code
@property(nonatomic,copy,readwrite)NSString *msg;//返回的消息
@property (nonatomic,assign) id data;
@property(nonatomic,assign,readwrite)long long updateTime;
@property (nonatomic,strong,readwrite) NSDictionary *map;


@property(nonatomic,assign,readwrite)BOOL isSuccess;//请求是否成功
@property(nonatomic,strong,readwrite)NSError *error;//返回的错误信息

@end

@implementation EEResponse

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    self.data = [dic objectForKey:@"data"];
    self.map = [dic objectForKey:@"map"];
    self.msg = [dic objectForKey:@"msg"];
    return YES;
}

- (void)setup{
#warning ---后期添加判断和错误码---
//    self.isSuccess = ([self.code isEqualToString:NWCode_SUCCESS])?YES:NO;
}

@end
