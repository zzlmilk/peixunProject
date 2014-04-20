//
//  ViewController.m
//  Lesson_4
//
//  Created by zzlmilk on 14-4-20.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//


#import "ViewController.h"
#import "House.h"
#import "UIImageView+AFNetworking.h"
#import "TapDetectingImageView.h"


@interface ViewController ()<tapDetectingImageViewDelegate>
{
    UIPageControl  * pageControl;
    UIImageView *imageView;
    House *h;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.contentSize = CGSizeMake(320*3, 128);
    [self.scrollView setPagingEnabled:YES];
    
    
    h = [[House alloc]init];
    h.houseAddress = @"常青藤一期";
    h.houseImages = [NSMutableArray array];
    [h.houseImages addObject:@"http://www.nbnt.com.cn/disp_pic.php?type=housepic&size=1&imgid=64969&id=368295"];
    [h.houseImages addObject:@"http://www.nbnt.com.cn/disp_pic.php?type=housepic&size=1&imgid=64972&id=368295"];
    [h.houseImages addObject:@"http://www.nbnt.com.cn/disp_pic.php?type=housepic&size=1&imgid=64974&id=368295"];
    
    
    TapDetectingImageView *view1 = [[TapDetectingImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 128)];
    view1.backgroundColor = [UIColor brownColor];
    [view1 setImageWithURL:[NSURL URLWithString:[h.houseImages objectAtIndex:0]]];
    view1.contentMode = UIViewContentModeScaleAspectFill;
    view1.delegate =self;
    
    [self.scrollView addSubview:view1];
     

    
    TapDetectingImageView *view2 = [[TapDetectingImageView alloc]initWithFrame:CGRectMake(320, 0, 320, 128)];
    [view2 setImageWithURL:[NSURL URLWithString:[h.houseImages objectAtIndex:1]]];
    view2.contentMode = UIViewContentModeScaleAspectFill;
    view2.backgroundColor = [UIColor orangeColor];
    view2.delegate = self;
    [self.scrollView addSubview:view2];
    
    
    TapDetectingImageView *view3 = [[TapDetectingImageView alloc]initWithFrame:CGRectMake(320*2, 0, 320, 128)];
        view3.delegate = self;
    [view3 setImageWithURL:[NSURL URLWithString:[h.houseImages objectAtIndex:2]]];
    view3.contentMode = UIViewContentModeScaleAspectFill;
    view3.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:view3];

    
    self.scrollView.delegate = self;
    
    
     pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(150, 400, 100, 20)];
//    pageControl.backgroundColor = [UIColor purpleColor];
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;

     [self.view addSubview:pageControl];
    
    self.view.backgroundColor = [UIColor brownColor];
    
   
    [House getHouseInfoParmars:nil withBlock:^(House *h) {
        
    }];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
    self.aView.backgroundColor = [UIColor yellowColor];
    
    //autoLayout
    
    //tap 手势
    //初始化
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hanleGesture)];
    //添加手势
    [self.aView addGestureRecognizer:tapGesture];
    
    

    
    tapGesture.numberOfTapsRequired =2;
    tapGesture.numberOfTouchesRequired = 1; //default
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(hanldPong)];
    
    [self.aView addGestureRecognizer:longPress];
    
    
    UISwipeGestureRecognizer * swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.aView addGestureRecognizer:swipeRight];
    
 
}


-(void)tapDetectingImageView:(TapDetectingImageView *)view gotSingleTapAtPoint:(CGPoint)tapPoint{
    NSLog(@"%@",view.image);
    NSLog(@"%@",NSStringFromCGPoint(tapPoint));
    
    
    
   // view.frame = CGRectMake(0, 0, 320, 480);
    
    if (imageView) {
        [imageView removeFromSuperview];
        imageView = nil;
    }
    else{
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [UIView animateWithDuration:0.25f animations:^{
            imageView.frame= CGRectMake(0, 0, 320, 556);
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.image = view.image;
            [self.view addSubview:imageView];
            self.view.backgroundColor = [UIColor blackColor];
        }];

    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    int page = scrollView.contentOffset.x / 320;
    pageControl.currentPage = page;
    
//    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
//    [UIView animateWithDuration:0.25f animations:^{
//        imageView.frame= CGRectMake(0, 0, 320, 556);
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
//       [imageView setImageWithURL:[h.houseImages objectAtIndex:page]];
//        [self.view addSubview:imageView];
//        self.view.backgroundColor = [UIColor blackColor];
//    }];

   }

-(void)swipeRight{
    NSLog(@"swipeRight");
}
-(void)hanldPong{
    NSLog(@"hanldPong");
}


-(void)hanleGesture{
    NSLog(@"tap hanleGesture ");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
