//
//  ViewController.h
//  Lesson_4
//
//  Created by zzlmilk on 14-4-20.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

//IBOutlet 关联UI控件
//IBAction 关联事件

@property (nonatomic,strong) IBOutlet UILabel *label;

@property (nonatomic,strong) IBOutlet UIView *aView;

-(NSDictionary *)buttonPress;

@property (nonatomic,strong)IBOutlet UIScrollView *scrollView;

@end
