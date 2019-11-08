//
//  EEHttpService.m
//  MotoBand2019
//
//  Created by Eric on 2019/4/15.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "EEHttpService.h"

#import "EERequest.h"
#import "EEResponse.h"
#import "EEAppDotNetApiClient.h"

#import <MBSignUntil.h>
#import <ReactiveObjC.h>
#import <AFNetworking.h>
#import <YYKit/NSObject+YYModel.h>

NSString *const EEHttpErrorDomain = @"EEHttpErrorDomain";
NSString *const EEHttpErrorMessage = @"EEHttpErrorMessage";

@interface EEHttpService ()

@end

@implementation EEHttpService

+ (instancetype)shareInstance{
    static EEHttpService *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (RACSignal *)sendRequest:(EERequest *)request{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        EEAppDotNetApiClient *manager = [EEAppDotNetApiClient sharedClient];
        manager.requestSerializer.timeoutInterval = request.timeout;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

        //创建网络请求
        __block NSURLSessionDataTask *task = nil;
        
        task = [manager POST:request.url parameters:request.params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"========网络请求成功========\r\n%@",[self toReponseString:task.response andRequest:task.currentRequest andResponseObj:responseObject]);
            NSDictionary *dic = [MBSignUntil mbVerifySignWithParamDic:responseObject];
            EEResponse *response = [EEResponse modelWithDictionary:dic];
            [response setup];
            [subscriber sendNext:response];
            [subscriber sendCompleted];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"=========网络请求失败========\r\n%@",[self toReponseString:task.response andRequest:task.currentRequest andResponseObj:nil]);

            [subscriber sendError:error];
            
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
    
    return [signal replayLazily];//多次订阅同样的信号，执行一次
}


- (NSString *)toReponseString:(NSURLResponse *)response andRequest:(NSURLRequest *)request andResponseObj:(id)resposeObj{
    if (request) {
        NSMutableString* ret = [[NSMutableString alloc] initWithCapacity:1024];
        [ret appendFormat:@"\r\n|--------------------Get Response Start-----------|\r\n"];
        [ret appendString:@"|----- EEResponse -----|\r\n"];
        [ret appendFormat:@"| url = %@\r\n",request.URL];
        [ret appendFormat:@"| requestMethod = %@\r\n",request.HTTPMethod];
        //        [ret appendFormat:@"| requestHeaders = %@\r\n",request.allHTTPHeaderFields];
        [ret appendFormat:@"| requestBody = %@\r\n",[[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]];
        [ret appendString:@"\r\n"];
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        //        [ret appendFormat:@"| responseHeaders = %@\r\n",httpResponse.allHeaderFields];
        [ret appendFormat:@"| responseStatusCode = %ld\r\n",(long)httpResponse.statusCode];
        [ret appendFormat:@"| responseResponseBody = %@\r\n",resposeObj];
        [ret appendFormat:@"|-------------------Get Response Finished---------------|\r\n"];
        return ret;
    }
    return nil;
}


@end
