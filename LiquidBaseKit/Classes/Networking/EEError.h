//
//  EEError.h
//  MotoBand2019
//
//  Created by Eric on 2019/4/16.
//  Copyright © 2019 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EEError : NSError

@property(nonatomic,assign,readonly)NSInteger error_code;
@property(nonatomic,copy,readonly)NSString *error_msg;

- (instancetype)initWithErrorCode:(NSInteger)code andMsg:(NSString *)msg;

@end

NS_ASSUME_NONNULL_END
