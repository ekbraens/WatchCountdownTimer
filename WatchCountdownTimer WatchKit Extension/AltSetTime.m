//
//  AltSetTime.m
//  WatchCountdownTimer
//
//  Created by New on 12/9/14.
//  Copyright (c) 2014 Braen. All rights reserved.
//

#import "AltSetTime.h"

@implementation AltSetTime

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        
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
