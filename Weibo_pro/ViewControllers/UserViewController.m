//
//  UserViewController.m
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "UserViewController.h"
#import "AFNetworkReachabilityManager.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    //判断网络状态
    BOOL f =  [AFNetworkReachabilityManager sharedManager].reachableViaWiFi;
   //BOOL f =  [AFNetworkReachabilityManager sharedManager].reachableViaWiFi;
    if (f) {
        NSLog(@"wifi");
    }
    else{
        NSLog(@"no wifi");
    }
    
    
    
    self.title = @"User";
        NSLog(@"viewDidLoad");
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     NSLog(@"viewWillAppear");
}

-(void)viewWillDisappear:(BOOL)animated{
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
