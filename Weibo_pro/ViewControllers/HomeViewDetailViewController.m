//
//  HomeViewDetailViewController.m
//  Weibo_pro
//
//  Created by zzlmilk on 14-4-13.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "HomeViewDetailViewController.h"

@interface HomeViewDetailViewController ()

@end

@implementation HomeViewDetailViewController

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
    
    NSLog(@"%@",[self.status text]);
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
