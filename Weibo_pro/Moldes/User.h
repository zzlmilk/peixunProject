//
//  User.h
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApIClient.h"
#import "Status.h"

@interface User : NSObject

@property(nonatomic) int userId;
@property (nonatomic,strong)NSString *screenName;
@property (nonatomic,strong)NSString *imageUrl;
@property(nonatomic,strong)NSString *description;
@property(nonatomic,strong)NSString *gender;
@property(nonatomic,strong)Status *status;




-(id)initWithDic:(NSDictionary *)dic;

+(NSURLSessionDataTask *)getWeiboWihtBlock:(void (^)(NSArray *userList))block;

+(NSURLSessionDataTask *)getUserWihtBlock:(void (^)(User * u))block;

@end
