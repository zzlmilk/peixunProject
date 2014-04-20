//
//  TapDetectingImageView.m
//  SyjRedess
//
//  Created by rex on 12-8-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TapDetectingImageView.h"

#define DOUBLE_TAP_DELAY 0.35


CGPoint midpointBetweenPointsLocal(CGPoint a, CGPoint b);

@interface TapDetectingImageView()

-(void)handleSingleTap;
- (void)handleDoubleTap;
- (void)handleTwoFingerTap;

@end

@implementation TapDetectingImageView

@synthesize delegate;

-(id)initWithImage:(UIImage *)image{
    if (self = [super initWithImage:image]){
        [self setUserInteractionEnabled:YES];
        [self setMultipleTouchEnabled:YES];
        twoFingerTapIsPossible = YES;
        multipeTouches = NO;
    }
    
    return self;
}
-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self setUserInteractionEnabled:YES];
        [self setMultipleTouchEnabled:YES];
        twoFingerTapIsPossible = YES;
        multipeTouches = NO;
    }
    
    return self;

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(handleSingleTap) object:nil];
    
    if ([[event touchesForView:self] count] >1) {
        multipeTouches =YES;
    }
    
    if([[event touchesForView:self] count] >2){
        twoFingerTapIsPossible =NO;
    }
    
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
     BOOL allTouchesEnded = ([touches count] == [[event touchesForView:self] count]);
    
    
     if (!multipeTouches) {
        UITouch *touch = [touches anyObject];
        tapLocation = [touch locationInView:self];
        
        if ([touch tapCount ]==1) {
            [self performSelector:@selector(handleSingleTap) withObject:nil afterDelay:DOUBLE_TAP_DELAY];
        }
        else if([touch tapCount] ==2){
            [self handleDoubleTap];
        }
    }
    
    else if ( multipeTouches && twoFingerTapIsPossible) {
        // case 1: this is the end of both touches at once 
        if ([touches count] == 2 && allTouchesEnded) {
            int i = 0; 
            int tapCounts[2]; CGPoint tapLocations[2];
            for (UITouch *touch in touches) {
                tapCounts[i]    = [touch tapCount];
                tapLocations[i] = [touch locationInView:self];
                i++;
            }
            if (tapCounts[0] == 1 && tapCounts[1] == 1) { // it's a two-finger tap if they're both single taps
                tapLocation = midpointBetweenPointsLocal(tapLocations[0], tapLocations[1]);
                [self handleTwoFingerTap];
            }
        }
        
        // case 2: this is the end of one touch, and the other hasn't ended yet
        else if ([touches count] == 1 && !allTouchesEnded) {
            UITouch *touch = [touches anyObject];
            if ([touch tapCount] == 1) {
                // if touch is a single tap, store its location so we can average it with the second touch location
                tapLocation = [touch locationInView:self];
            } else {
                twoFingerTapIsPossible = NO;
            }
        }
        
        // case 3: this is the end of the second of the two touches
        else if ([touches count] == 1 && allTouchesEnded) {
            UITouch *touch = [touches anyObject];
            if ([touch tapCount] == 1) {
                // if the last touch up is a single tap, this was a 2-finger tap
                tapLocation = midpointBetweenPointsLocal(tapLocation, [touch locationInView:self]);
                [self handleTwoFingerTap];
            }
        }
    }
    
    
    
    if (allTouchesEnded) {
        twoFingerTapIsPossible = YES;
        multipeTouches = NO;
    }
}


-(void)handleSingleTap{
    if ([delegate respondsToSelector:@selector(tapDetectingImageView:gotSingleTapAtPoint:)])
        [delegate tapDetectingImageView:self gotSingleTapAtPoint:tapLocation];
}

- (void)handleDoubleTap {
    if ([delegate respondsToSelector:@selector(tapDetectingImageView:gotDoubleTapAtPoint:)])
        [delegate tapDetectingImageView:self gotDoubleTapAtPoint:tapLocation];
}

- (void)handleTwoFingerTap {
    if ([delegate respondsToSelector:@selector(tapDetectingImageView:gotTwoFingerTapAtPoint:)])
        [delegate tapDetectingImageView:self gotTwoFingerTapAtPoint:tapLocation];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

CGPoint midpointBetweenPointsLocal(CGPoint a, CGPoint b) {
    CGFloat x = (a.x + b.x) / 2.0;
    CGFloat y = (a.y + b.y) / 2.0;
    return CGPointMake(x, y);
}
