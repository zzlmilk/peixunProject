//
//  Status.m
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "Status.h"
#import "ApIClient.h"
#import "User.h"


@implementation Status

-(id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
       _text = [dic objectForKey:@"text"];
       _source = [dic objectForKey:@"source"];
        NSDictionary *userDic = [dic objectForKey:@"user"];
        
        if (userDic) {
            _user = [[User alloc]initWithDic:userDic];
        }
        
        
    }
    return self;
}


+(void )statusByPublicTimelineParameters:(NSDictionary *)parameter WithBlock:(void (^)())block{
    
    
    
    
    [[ApIClient shareClient]GET:@"/2/statuses/public_timeline.json" parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        //请求成功 200
        //NSLog(@"%@",responseObject);

      NSArray *statusArray  =   [responseObject objectForKey:@"statuses"];
        
        NSMutableArray *statusList = [NSMutableArray array];
        for (int i=0; i<statusArray.count; i++) {
            NSDictionary *statusDic = [statusArray objectAtIndex:i];
            Status * s = [[Status alloc]initWithDic:statusDic];
            [statusList addObject:s];
        }
        
        
        
        NSLog(@"%@",statusList);
        block(statusList);
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //请求失败 
        NSLog(@"%@",error);
        block();
    }];
}


+(void)statusUpdateParameters:(NSDictionary *)parameter WithBlock:(void (^)(Status *))block{
    
    
    
    [[ApIClient shareClient]POST:@"/2/statuses/update.json" parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *statusDic =responseObject;
        Status * s = [[Status alloc]initWithDic:statusDic];
        block(s);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
@end
