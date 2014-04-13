//
//  UserViewController.h
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController<UIScrollViewDelegate>
{
    UIImageView *userImageView;
    UILabel *userLabel ;
    UILabel *descriptionLabel;
    UILabel *gender;
    
    UILabel *textLabel;
}
@end
