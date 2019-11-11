//
//  News.h
//  LiquidBaseKit_Example
//
//  Created by Eric on 2019/11/10.
//  Copyright © 2019 daxiangwork. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <BGFMDB.h>

@interface News : NSObject

@property(nonatomic,assign)NSInteger newsId;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *subTitle;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,assign)long long time;

@end
