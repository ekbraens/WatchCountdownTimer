//
//  SliderInterfaceController.m
//  WatchCountdownTimer
//
//  Created by New on 12/15/14.
//  Copyright (c) 2014 Braen. All rights reserved.
//
// slider doesnt work too well if i cannot select values without using +/-
// wish i could tap in the middle of the slider and have it move to that value...

#import "SliderInterfaceController.h"

@interface SliderInterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *sliderLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceSlider *slider;

@end

@implementation SliderInterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        float halfMinute = 30;
        [_slider setValue:halfMinute];
        [_sliderLabel setText:[NSString stringWithFormat:@"%.0f", halfMinute]];
        
    }
    return self;
}
- (IBAction)sliderAction:(float)value {
    [_sliderLabel setText:[NSString stringWithFormat:@"%.0f", value]];
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
