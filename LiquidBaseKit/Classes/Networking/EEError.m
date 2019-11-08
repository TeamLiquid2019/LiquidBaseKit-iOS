//
//  EEError.m
//  MotoBand2019
//
//  Created by Eric on 2019/4/16.
//  Copyright © 2019 Eric. All rights reserved.
//

#import "EEError.h"


@interface EEError ()

@property(nonatomic,copy,readwrite)NSInteger error_code;
@property(nonatomic,copy,readwrite)NSString *error_msg;

@end

@implementation EEError

- (instancetype)initWithErrorCode:(NSInteger )code andMsg:(NSString *)msg{
    self = [super init];
    if (self) {
        self.error_code = code;
        self.error_msg = msg;
    }
    return self;
}

@end
