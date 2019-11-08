//
//  EEAppDotNetApiClient.m
//  MotoBand2019
//
//  Created by Eric on 2019/4/15.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "EEAppDotNetApiClient.h"

//#import <CoreMacro.h>
//
//#import <CommonCrypto/CommonDigest.h>
//#import <CommonCrypto/CommonHMAC.h>

//static NSString *const secretId = @"AKIDKpo6me25b14nzcNefQeoqR95syh2ayx97s0g";
//static NSString *const secretKey = @"5a38htm67thU4xyrLvtektm1OP53FjjfMtw3trf8";

@implementation EEAppDotNetApiClient

+ (instancetype)sharedClient{
    return nil;
    
    
    
    
    
//    static EEAppDotNetApiClient *_shareAPIClient = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _shareAPIClient = [[self alloc]initWithBaseURL:[NSURL URLWithString:HttpBaseURLString]];
//
//        _shareAPIClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//    });
//
//    AFHTTPRequestSerializer *_requestSerializer = [AFJSONRequestSerializer serializer];
//
//    //设置API网关
//    static NSDateFormatter *formatter = nil;
//    static dispatch_once_t onceToken_1;
//    dispatch_once(&onceToken_1, ^{
//        //设置API网关时间格式
//        formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss 'GMT'";
//        formatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
//        formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
//    });
//
//    NSString *dateString = [formatter stringFromDate:[NSDate date]];
//    [_requestSerializer setValue:dateString forHTTPHeaderField:@"Date"];
//    //来源
//    [_requestSerializer setValue:@"iOSApp" forHTTPHeaderField:@"Source"];
//
//    //headers
//    NSArray *headers = [_requestSerializer.HTTPRequestHeaders allKeys];
//    //排序
//    headers = [headers sortedArrayUsingComparator:^(NSString * obj1, NSString * obj2){
//        return (NSComparisonResult)[obj1 compare:obj2 options:NSCaseInsensitiveSearch];
//    }];
//    NSMutableString *contentBuilder = [[NSMutableString alloc] init];
//    for (NSString *key in headers) {
//        [contentBuilder appendFormat:@"\n%@: %@",
//         [key lowercaseString], [_requestSerializer valueForHTTPHeaderField:key]];
//    }
//
//    NSString *content = [contentBuilder substringFromIndex:1];
//
//    const char *c_key = [secretKey cStringUsingEncoding:NSASCIIStringEncoding];
//    const char *c_data = [content cStringUsingEncoding:NSASCIIStringEncoding];
//    unsigned char c_hmac_digest[CC_SHA1_DIGEST_LENGTH];
//    CCHmac(kCCHmacAlgSHA1,
//           c_key,
//           strlen(c_key),
//           c_data,
//           strlen(c_data),
//           c_hmac_digest);
//    NSString *sign = [[[NSData alloc] initWithBytes:c_hmac_digest
//                                             length:sizeof(c_hmac_digest)]
//                      base64EncodedStringWithOptions:0];
//    NSString *authorization = [NSString stringWithFormat:@"hmac id=\"%@\", algorithm=\"hmac-sha1\", headers=\"%@\", signature=\"%@\"",
//                               secretId,
//                               [headers componentsJoinedByString:@" "],
//                               sign];
//    [_requestSerializer setValue:authorization
//              forHTTPHeaderField:@"Authorization"];
//    _shareAPIClient.requestSerializer = _requestSerializer;
//
//    return _shareAPIClient;
}

@end
