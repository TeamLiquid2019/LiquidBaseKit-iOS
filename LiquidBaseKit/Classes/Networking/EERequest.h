//
//  EERequest.h
//  MotoBand2019
//
//  Created by Eric on 2019/4/15.
//  Copyright © 2019 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, EERequestType) {
    EERequestType_Post = 0,
    EERequestType_Get,
};

@interface EERequest : NSObject

@property(nonatomic,copy)NSString *url;//基于baseUrl的相对url
@property(nonatomic,assign)EERequestType requestType;//Post 或者 Get，后期需要其他可以补充
@property(nonatomic,strong)NSMutableDictionary *params;//请求参数
@property(nonatomic,assign)int timeout;//超时时间
@property(nonatomic,assign)BOOL isValidUser;//是否验证用户（项目特定需求）

+ (instancetype)requestWithUrl:(NSString *)url params:(NSMutableDictionary *)parametersDic;

@end

NS_ASSUME_NONNULL_END
