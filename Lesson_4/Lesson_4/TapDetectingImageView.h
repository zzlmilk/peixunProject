//
//  TapDetectingImageView.h
//  SyjRedess
//
//  Created by rex on 12-8-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tapDetectingImageViewDelegate;
    

@interface TapDetectingImageView : UIImageView
{
   // id<tapDetectingImageViewDelegate> delegate;

    CGPoint tapLocation;
    BOOL multipeTouches;
    BOOL twoFingerTapIsPossible;
    
}

@property (nonatomic , assign)id <tapDetectingImageViewDelegate>delegate;

@end


@protocol tapDetectingImageViewDelegate <NSObject>

@optional

- (void)tapDetectingImageView:(TapDetectingImageView *)view gotSingleTapAtPoint:(CGPoint)tapPoint;
- (void)tapDetectingImageView:(TapDetectingImageView *)view gotDoubleTapAtPoint:(CGPoint)tapPoint;
- (void)tapDetectingImageView:(TapDetectingImageView *)view gotTwoFingerTapAtPoint:(CGPoint)tapPoint;


@end
