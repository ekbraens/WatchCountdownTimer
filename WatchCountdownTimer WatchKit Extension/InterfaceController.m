//
//  InterfaceController.m
//  WatchCountdownTimer WatchKit Extension
//
//  Created by New on 12/6/14.
//  Copyright (c) 2014 Braen. All rights reserved.
//
// set timer with calulator type buttons
// use menu to increment common increases in timer 30sec 1 minute

#import "InterfaceController.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceTimer *timer;

@end


@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        
        // make the target time 30 seconds from now (NSDate date)
        NSDate * targetTime = [NSDate dateWithTimeInterval:30 sinceDate:[NSDate date]];
        // give the timer this information with setDate
        [self.timer setDate:targetTime];
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

@end



