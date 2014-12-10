//
//  InterfaceController.m
//  WatchCountdownTimer WatchKit Extension
//
//  Created by New on 12/6/14.
//  Copyright (c) 2014 Braen. All rights reserved.
//
// set timer with calulator type buttons :: DONE!
// use menu to increment "common" increases in timer 30sec 1 minute :: DONE!
// transfer "intput" from 2nd watchface to initial one... how? DELEGATION!! :: DONE!
// make sure when the timer reaches zero, you can still increment "common" increases :: TODO
// make new time selection screen, using tables for minutes and seconds :: TODO

#import "InterfaceController.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceTimer *timer;
@property (nonatomic, strong) NSDate * targetTime;

//might not need, not sure how to connect yet
//@property (nonatomic, strong) TimerButtons * timerButtonScreen;
@property (nonatomic) double timeFromButtonScreen;

@end

@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        /*
        _timeFromButtonScreen = 0;
        _timerButtonScreen = [[TimerButtons alloc] init];
        
        // this would work if i was using modal segues
        // but because i am using page based, all initWithContexts are called at once
        // so i think delegation is in order
        
        if (context)
        {
            NSString * testString = [[NSString alloc] initWithString:context];
            NSLog(@"%@", testString);
        }
        //_timerButtonScreen = context;
         */
        
        // make the target time 30 seconds from now (NSDate date)
        _targetTime = [NSDate dateWithTimeInterval:30 sinceDate:[NSDate date]];
        // give the timer this information with setDate
        [self.timer setDate:_targetTime];
    }
    return self;
}

#pragma mark - Menu Buttons

- (IBAction)thirtySecondsAdd {
    _targetTime = [NSDate dateWithTimeInterval:30 sinceDate:_targetTime];
    [self.timer setDate:_targetTime];
}
- (IBAction)oneMinuteAdd {
    _targetTime = [NSDate dateWithTimeInterval:60 sinceDate:_targetTime];
    [self.timer setDate:_targetTime];
}
- (IBAction)fiveMinuteAdd {
    _targetTime = [NSDate dateWithTimeInterval:300 sinceDate:_targetTime];
    [self.timer setDate:_targetTime];
}
- (IBAction)tenMinuteAdd {
    return;
}

#pragma mark - De/Activate

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
    
    NSUserDefaults * userTimePreference = [[NSUserDefaults alloc] init];
    _timeFromButtonScreen = [userTimePreference doubleForKey:@"timeTransfer"];
    if (_timeFromButtonScreen != 0)
    {
        NSDate * targetTime = [NSDate dateWithTimeInterval:_timeFromButtonScreen
                                                 sinceDate:[NSDate date]];
        [self.timer setDate:targetTime];
    }
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

@end



