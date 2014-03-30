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

@property (nonatomic,strong)User *user;


@end
