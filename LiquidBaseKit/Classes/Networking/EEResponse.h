//
//  EEResponse.h
//  MotoBand2019
//
//  Created by Eric on 2019/4/15.
//  Copyright © 2019 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EEResponse : NSObject

@property(nonatomic,copy,readonly)NSString *code;//返回成功或者失败code
@property(nonatomic,copy,readonly)NSString *msg;//返回的消息
@property (nonatomic,assign,readonly) id data;
@property(nonatomic,assign,readonly)long long updateTime;
@property (nonatomic,strong,readonly) NSDictionary *map;

@property(nonatomic,assign,readonly)BOOL isSuccess;//请求是否成功
@property(nonatomic,strong,readonly)NSError *error;//返回的错误信息

- (void)setup;

@end

NS_ASSUME_NONNULL_END
