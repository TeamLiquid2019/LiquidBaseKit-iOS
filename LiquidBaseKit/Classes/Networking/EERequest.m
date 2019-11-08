//
//  EERequest.m
//  MotoBand2019
//
//  Created by Eric on 2019/4/15.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "EERequest.h"

#import <TLUtil.h>
#import <MBSignUntil.h>

@implementation EERequest

+ (instancetype)requestWithUrl:(NSString *)url params:(NSMutableDictionary *)parametersDic{
    return [[EERequest alloc] initRequstWithUrl:url params:parametersDic];
}

- (instancetype)initRequstWithUrl:(NSString *)url params:(NSMutableDictionary *)parametersDic{
    self = [super init];
    if (self) {
        self.url = url;
        self.timeout = 10;
        self.isValidUser = YES;
        self.requestType = EERequestType_Post;
        
        if (parametersDic == nil) {
            self.params = [[NSMutableDictionary alloc] init];
        }else{
            self.params = parametersDic;
        }
        
        //添加固定参数
        //TODO:后期要修改
        //        NSString *userID = [LogonManager getCurrentUserId];
        //        NSString *userToken = [LogonManager getCurrentUserToken];
        //        if (validUser==YES) {
        //            if (!userID || !userToken) {
        //                if (backData) {
        //                    backData(nil,MBCode_ERROR);
        //                }
        //                return;
        //            }
        //            [parmeters setObject:userID forKey:@"userid"];
        //            [parmeters setObject:userToken forKey:@"token"];
        //        }
        
        NSString *reqClient = @"100";
        long long longlongReqTime = [[NSDate date]timeIntervalSince1970];
        NSString *reqTime = [self dateyyyyMMddhhmmssfff:longlongReqTime];
        NSString *reqUUIDStr = [TLUtil getUUIDString];
        NSString *reqUUID = [reqUUIDStr substringFromIndex:reqUUIDStr.length-16];
        NSString *reqNumber = [NSString stringWithFormat:@"%@%@%@",reqClient,reqTime,reqUUID];
        [self.params setObject:reqNumber forKey:@"requestid"];
        
        [self.params setObject:@"1" forKey:@"ctype"];
        
        NSString *version = [[[NSBundle mainBundle]infoDictionary]valueForKey:@"CFBundleShortVersionString"];
        NSString *build = [[[NSBundle mainBundle]infoDictionary]valueForKey:@"CFBundleVersion"];
        NSString *cversion = [NSString stringWithFormat:@"%@.%@",version,build];
        [self.params setObject:cversion forKey:@"cversion"];
        
        //TODO:后期要添加
//        NSString *deviceToken = [LogonManager getDeviceToken];
//        if (deviceToken) {
//            [parmeters setObject:deviceToken forKey:@"devicetoken"];
//        }
        
        self.params = [[NSMutableDictionary alloc]initWithDictionary:[MBSignUntil mbSigntWithParamDic:self.params]];
    }
    return self;
}

- (NSString *)dateyyyyMMddhhmmssfff:(long long)date{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken_1;
    dispatch_once(&onceToken_1, ^{
        //设置API网关时间格式
        [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
        [dateFormatter setCalendar: [NSCalendar autoupdatingCurrentCalendar]];
    });
    NSString *timeStr = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
    int x = (int)(100 + (arc4random() % (1000 - 100 + 1)));
    return [NSString stringWithFormat:@"%@%@",timeStr,[NSString stringWithFormat:@"%d",x]];
}

@end
