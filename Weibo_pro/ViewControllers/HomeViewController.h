//
//  HomeViewController.h
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;
@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    //UINavigationController *navVC;

    NSMutableArray *list;

    BOOL _reloading;
}
-(void)reloadData;
-(void)doneLoading;

@end
