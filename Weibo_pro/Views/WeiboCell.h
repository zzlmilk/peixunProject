//
//  WeiboCell.h
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Status.h"


@interface WeiboCell : UITableViewCell
{
   
}


@property (nonatomic,strong)Status *status;


@property(nonatomic,strong)  UIImageView *userImageView;
@property(nonatomic,strong)  UILabel *userNameLabel;
@property(nonatomic,strong)  UILabel *weiboTextLabel;

+(CGFloat)cellHeight:(Status *)status;

@end
