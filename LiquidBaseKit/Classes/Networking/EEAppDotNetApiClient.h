//
//  EEAppDotNetApiClient.h
//  MotoBand2019
//
//  Created by Eric on 2019/4/15.
//  Copyright © 2019 Eric. All rights reserved.
//

#import <AFNetworking/AFHTTPSessionManager.h>

@interface EEAppDotNetApiClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
