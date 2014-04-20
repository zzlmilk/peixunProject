//
//  House.h
//  Lesson_4
//
//  Created by zzlmilk on 14-4-20.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface House : NSObject

@property(nonatomic,strong)NSString *houseAddress;
@property (nonatomic,strong)NSMutableArray *houseImages;

+(void)getHouseInfoParmars:(NSDictionary *)parmars withBlock:(void (^)(House * h))block;

@end
