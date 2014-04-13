//
//  Status.h
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>


@class User;
@interface Status : NSObject
{}

@property (nonatomic,strong)NSString *text;
@property (nonatomic,strong)NSString *source;
@property (nonatomic,strong)User *user;

-(id)initWithDic:(NSDictionary *)dic;


//请求public weibo数据
+(void )statusByPublicTimelineParameters:(NSDictionary *)parameter WithBlock:(void (^) (NSMutableArray * statusArray))block;

//发微博
+(void)statusUpdateParameters:(NSDictionary *)parameter WithBlock:(void (^)(Status *))block;





@end
