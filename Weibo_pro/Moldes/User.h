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

@property(nonatomic) int userId;
@property (nonatomic,strong)NSString *screenName;
@property (nonatomic,strong)NSString *imageUrl;


-(id)initWithDic:(NSDictionary *)dic;

+(NSURLSessionDataTask *)getWeiboWihtBlock:(void (^)(NSArray *userList))block;

@end
