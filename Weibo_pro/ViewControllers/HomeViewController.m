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
#import "Status.h"
#import "MBProgressHUD.h"

#import "EGORefreshTableHeaderView.h"
#import "HomeViewDetailViewController.h"



@interface HomeViewController ()<EGORefreshTableHeaderDelegate>
{
    EGORefreshTableHeaderView *view;
    UITableView *tableView;
}
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
    
//        NSDictionary *dic = [NSDictionary dictionaryWithObject:@"2.00CRgIDC7EG4JE58ef8087bdlMIUVD" forKey:@"access_token"];
 
    
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
    
    
    tableView = [[UITableView alloc]init];
    tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:tableView];
    
    
    //下拉刷新
    view =[[EGORefreshTableHeaderView alloc]initWithFrame:CGRectMake(0, -100, self.view.bounds.size.width, 100)];
    [tableView addSubview:view];
    view.delegate = self;
    
    //  update the last update date
    [view refreshLastUpdatedDate];
    
    
    tableView.delegate = self;
    tableView.dataSource =self;
    
    tableView.scrollEnabled = YES;
    
    
//    // 发微博
//    NSMutableDictionary *updateDic =[[NSMutableDictionary alloc]init];
//    [updateDic setObject:@"2.00CRgIDC7EG4JE58ef8087bdlMIUVD" forKey:@"access_token"];
//    [updateDic setObject:@"text weibo" forKey:@"status"];
//    
//    [Status statusUpdateParameters:updateDic WithBlock:^(Status *s){
//        NSLog(@"%@",s.text);
//    }];
//
    [self getData];

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

-(void)getData{
    
    //网络请求
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
    [dic setObject:@"2.00CRgIDC7EG4JE58ef8087bdlMIUVD" forKey:@"access_token"];
    [dic setObject:@"21" forKey:@"count"];

    
    MBProgressHUD *progressHub = [[MBProgressHUD alloc]init];
    progressHub.mode = MBProgressHUDModeDeterminate;
    [progressHub show:YES];
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [Status statusByPublicTimelineParameters:dic WithBlock:^(NSMutableArray *statusArray) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        list = statusArray;
        [tableView reloadData];
    }];

    
}


#pragma mark --- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return list.count;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   Status * s = [list objectAtIndex:indexPath.row];
   return [WeiboCell cellHeight:s] +44 ;
    
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
    
    Status * s = [list objectAtIndex:indexPath.row];
    
    cell.status = s;
    
    return cell;
    
    
}

-(void)reloadData{
    
   // [self getData];
    [NSThread sleepForTimeInterval:3];
    _reloading = YES;
    //
}

-(void)doneLoading{
    _reloading = NO;
    [view egoRefreshScrollViewDataSourceDidFinishedLoading:tableView];
}


#pragma mark ---- UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d",indexPath.row);
    HomeViewDetailViewController *detailVC = [[HomeViewDetailViewController alloc]init];
    Status * s = [list objectAtIndex:indexPath.row];
    detailVC.status = s;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - UIScrllViewDelegate Methods
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
  
  //  [view egoRefreshScrollViewDidScroll:scrollView];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [view egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark EGORefreshTableHeaderDelegate 
-(void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view{
    //请求数据
   // [self getData];
    
    [self reloadData];
    
    [self performSelector:@selector(doneLoading) withObject:nil afterDelay:3.0];
    
    
}

-(BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view{
    return _reloading;
}

-(NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view{
    return [NSDate date]; 
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
