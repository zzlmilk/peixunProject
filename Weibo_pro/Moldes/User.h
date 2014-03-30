//
//  User.h
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApIClient.h"

@interface User : NSObject

@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *text;
@property (nonatomic,strong)NSString *imageName;


-(id)initWithDic:(NSDictionary *)dic;

+(NSURLSessionDataTask *)getWeiboWihtBlock:(void (^)(NSArray *userList))block;

@end
