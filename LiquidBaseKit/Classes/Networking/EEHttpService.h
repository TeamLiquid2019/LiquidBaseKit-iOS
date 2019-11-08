//
//  EEHttpService.h
//  MotoBand2019
//
//  Created by Eric on 2019/4/15.
//  Copyright © 2019 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EERequest,RACSignal;

NS_ASSUME_NONNULL_BEGIN

@interface EEHttpService : NSObject

+ (instancetype)shareInstance;

- (RACSignal *)sendRequest:(EERequest *)request;

@end

NS_ASSUME_NONNULL_END
