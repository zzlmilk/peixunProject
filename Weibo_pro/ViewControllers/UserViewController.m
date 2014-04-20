//
//  UserViewController.m
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "UserViewController.h"
#import "AFNetworkReachabilityManager.h"
#import "User.h"

@interface UserViewController ()
{
    UILabel *nameLabel;
}
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
    
     nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, 120, 30)];
    self.view.backgroundColor = [UIColor whiteColor];
    
    userImageView  =[[UIImageView alloc]initWithFrame:CGRectMake(30, 30, 88, 88)];
    [self.view addSubview:userImageView];
    
    
    
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     NSLog(@"viewWillAppear");
    
    
    NSString *name =  [[NSUserDefaults standardUserDefaults] objectForKey:@"u_name"];
    nameLabel.text = name;
    [self.view addSubview:nameLabel];
    
    
    
    
    [User getUserWihtBlock:^(User *u) {
        
    }];
    
    
}


-(void)viewWillDisappear:(BOOL)animated{
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
