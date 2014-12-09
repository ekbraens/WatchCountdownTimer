//
//  TimerButtons.h
//  WatchCountdownTimer
//
//  Created by New on 12/7/14.
//  Copyright (c) 2014 Braen. All rights reserved.
//

#import <WatchKit/WatchKit.h>

// #1/4 make the protocol and use this method inside THIS class
@protocol TimerButtonsDelegate

-(void)moveIntputOver:(int)timerButtons;

@end


@interface TimerButtons : WKInterfaceController

@property (nonatomic) int timeIntput;

@property (nonatomic, assign) id  delegate;
-(void)transferOfIntputDelegate;

@end
