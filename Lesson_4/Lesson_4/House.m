//
//  House.m
//  Lesson_4
//
//  Created by zzlmilk on 14-4-20.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "House.h"
#import "ApIClient.h"

@implementation House

+(void)getHouseInfoParmars:(NSDictionary *)parmars withBlock:(void (^)(House *))block{
    
    parmars = [NSMutableDictionary dictionary];
    [parmars setValue:@"e15a48e2bf0cc2d8e8fc61b8a32fc1e4" forKey:@"PwdStr"];
    [parmars setValue:@"368295" forKey:@"HouseId"];
    [parmars setValue:@"3" forKey:@"MemberId"];
    
    

    
    [[ApIClient shareClient]GET:@"/AppAction/GetHouseInfo.php" parameters:parmars success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}

@end
