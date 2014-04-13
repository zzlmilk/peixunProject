//
//  LoginViewController.m
//  Weibo_pro
//
//  Created by zzlmilk on 14-4-13.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "LoginViewController.h"
#import "UserViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
{
    UITextField *nameTextFiled;
    UITextField *passwordTextFiled;
}
@end

@implementation LoginViewController

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
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor brownColor];
     nameTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(60, 40, 200, 44)];
    nameTextFiled.delegate = self;
    //nameTextFiled.backgroundColor = [UIColor blackColor];
    nameTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:nameTextFiled];
    
     passwordTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(60, 104, 200, 44)];
    passwordTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextFiled.secureTextEntry  = YES;
    [self.view addSubview:passwordTextFiled];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    loginButton.frame = CGRectMake(60, 168, 200, 44);
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginButton];
    
    
    
    
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"%@",[textField text]);
    if (![[textField text] isEqualToString:@"Rex"]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"tip" message:@"用户名不正确" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

-(void)login{
    
    
    //假设服务器认证用户成功
    BOOL restult =  NO;
    if (restult) {
        UserViewController *userVC = [[UserViewController alloc]init];
        [self presentViewController:userVC animated:YES completion:^{
            
        }];
    }
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [nameTextFiled resignFirstResponder];
    [passwordTextFiled resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
