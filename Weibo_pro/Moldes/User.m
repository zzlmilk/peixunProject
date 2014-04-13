//
//  User.m
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "User.h"

@implementation User

-(id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _userId = [[dic objectForKey:@"id"] intValue];
        _screenName = [dic objectForKey:@"screen_name"];
        _imageUrl  = [dic objectForKey:@"profile_image_url"];
    }
    return self;
}

+(NSURLSessionDataTask*)getWeiboWihtBlock:(void (^)(NSArray *))block{
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
    [dic setObject:@"2.00CRgIDC7EG4JE58ef8087bdlMIUVD" forKey:@"access_token"];
    [dic setObject:@"20" forKey:@"count"];
    
    
    return [[ApIClient shareClient]GET:@"/2/statuses/public_timeline.json" parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",responseObject);
        NSArray *arr = [responseObject objectForKey:@"statuses"];
        
        NSMutableArray *userList = [[NSMutableArray alloc]init];
        for (int i=0; i<arr.count; i++) {
            User *u=[[User alloc]initWithDic:[arr objectAtIndex:i]];
            [userList addObject:u];
        }
        
        block(userList);
                
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}

+(NSURLSessionDataTask *)getUserWihtBlock:(void (^)(User * u))block{
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
    [dic setObject:@"2.00CRgIDC7EG4JE58ef8087bdlMIUVD" forKey:@"access_token"];
    [dic setObject:@"3923955369" forKey:@"uid"];
    
    
    return [[ApIClient shareClient]GET:@"/2/users/show.json" parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    

}

@end
