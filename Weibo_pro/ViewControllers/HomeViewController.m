//
//  HomeViewController.m
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "HomeViewController.h"
#import "UserViewController.h"
#import "WeiboCell.h"
#import "User.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

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
    
    
//    userList = [[NSMutableArray alloc]init];
//    
//    for (int i = 0; i<10; i++) {
//        User * u = [[User alloc]init];
//        u.name = [NSString stringWithFormat:@"%d",i];
//        u.text =@"要改造阳台的亲可借鉴哦";
//        u.imageName = @"0.jpeg";
//
//        [userList addObject:u];
//        
//    }
//    
    
    
    
    self.view.backgroundColor = [UIColor magentaColor];
	// Do any additional setup after loading the view.
    
    self.title = @"Home";
    
    
    UITableView *tableView = [[UITableView alloc]init];
    tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource =self;
    
    tableView.scrollEnabled = YES;
    
    [User getWeiboWihtBlock:^(NSArray *list) {
        userList =[NSMutableArray arrayWithArray:list];
        [tableView reloadData];
    }];

    
    /*
    UIButton *button =[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    button.backgroundColor =[UIColor yellowColor];
    button.frame = CGRectMake(100, 100, 50, 50);
    [button setTitle:@"button" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    //为button 添加事件
    [button addTarget:self action:@selector(buttonPress) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"viewDidLoad");
     */
    
    
    
}


#pragma mark --- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return userList.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==2) {
        return 80;
    }

    return 100;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"title";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellId = @"myCellId";
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[WeiboCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    
    cell.user = [userList objectAtIndex:indexPath.row];
    
    return cell;
    
    
}



#pragma mark ---- UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d",indexPath.row);
}




-(void)buttonPress{
    NSLog(@"button press!!!");
    UserViewController *userViewController=[[UserViewController alloc]init];
    [self.navigationController pushViewController:userViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
