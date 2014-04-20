//
//  AudioViewController.m
//  Lesson_4
//
//  Created by zzlmilk on 14-4-20.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "AudioViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface AudioViewController ()

@end

@implementation AudioViewController

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
 
    UIButton *b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    b.autoresizingMask =  UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight;
    
    
    
    
    b.frame  = CGRectMake(100, 100, 80, 60);
    [self.view addSubview:b];
    [b addTarget:self action:@selector(bpress) forControlEvents:UIControlEventTouchUpInside];
    [b setTitle:@"b" forState:UIControlStateNormal];
    
    /*
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"aa"
                                         ofType:@"mp3"]];
    
    
    
    NSError *error;
    AVAudioPlayer *_audioPlayer = [[AVAudioPlayer alloc]
                    initWithContentsOfURL:url
                    error:&error];
    
    _audioPlayer.volume = 10;
    [_audioPlayer play];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
//        [NSThread sleepForTimeInterval:100];
  //          NSLog(@"%f",_audioPlayer.currentTime);
    });
     */
}

-(void)bpress{
    UIImagePickerController *pick = [[UIImagePickerController alloc]init];
    pick.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:pick animated:YES completion:^{
        
    }];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
