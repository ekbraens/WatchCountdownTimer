//
//  TimerButtons.m
//  WatchCountdownTimer
//
//  Created by New on 12/7/14.
//  Copyright (c) 2014 Braen. All rights reserved.
//

#import "TimerButtons.h"

@interface TimerButtons()

@property (nonatomic, strong) NSMutableString * totalValue;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *sTimeLabel;

@end

@implementation TimerButtons

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        
        // initialized totalValue to be used for button pressing
        // i will use this mutableString to both setText the label and give the int to transfer to initial watchface
        _totalValue = [[NSMutableString alloc] init];
    }
    return self;
}

#pragma mark - Numbers

- (IBAction)zeroPressed {
    if (![_totalValue isEqualToString:@""])
    {
        [self.totalValue appendString:@"0"];
        [_sTimeLabel setText:_totalValue];
        
        self.timeIntput = [_totalValue intValue];
        [self timeInputMovement];
    }
}
- (IBAction)onePressed {
    [self.totalValue appendString:@"1"];
    [_sTimeLabel setText:_totalValue];
    
    self.timeIntput = [_totalValue intValue];
    [self timeInputMovement];
}
- (IBAction)twoPressed {
    [self.totalValue appendString:@"2"];
    [_sTimeLabel setText:_totalValue];
    
    self.timeIntput = [_totalValue intValue];
    [self timeInputMovement];
}
- (IBAction)threePressed {
    [self.totalValue appendString:@"3"];
    [_sTimeLabel setText:_totalValue];
    
    self.timeIntput = [_totalValue intValue];
    [self timeInputMovement];
}
- (IBAction)fourPressed {
    [self.totalValue appendString:@"4"];
    [_sTimeLabel setText:_totalValue];
    
    self.timeIntput = [_totalValue intValue];
    [self timeInputMovement];
}
- (IBAction)fivePressed {
    [self.totalValue appendString:@"5"];
    [_sTimeLabel setText:_totalValue];
    
    self.timeIntput = [_totalValue intValue];
    [self timeInputMovement];
}
- (IBAction)sixPressed {
    [self.totalValue appendString:@"6"];
    [_sTimeLabel setText:_totalValue];
    
    self.timeIntput = [_totalValue intValue];
    [self timeInputMovement];
}
- (IBAction)sevenPressed {
    [self.totalValue appendString:@"7"];
    [_sTimeLabel setText:_totalValue];
    
    self.timeIntput = [_totalValue intValue];
    [self timeInputMovement];
}
- (IBAction)eightPressed {
    [self.totalValue appendString:@"8"];
    [_sTimeLabel setText:_totalValue];
    
    self.timeIntput = [_totalValue intValue];
    [self timeInputMovement];
}
- (IBAction)ninePressed {
    [self.totalValue appendString:@"9"];
    [_sTimeLabel setText:_totalValue];
    
    self.timeIntput = [_totalValue intValue];
    [self timeInputMovement];
}

#pragma mark - Data Movement

-(void)timeInputMovement
{
    NSUserDefaults * timeTransfer = [[NSUserDefaults alloc] init];
    int i = [_totalValue intValue];
    [timeTransfer setDouble:i forKey:@"timeTransfer"];
}

#pragma mark - De/Activate

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
    
    // everytime we come back to the set timer, I want it to be blank
    [self.totalValue setString:@""];
    [_sTimeLabel setText:_totalValue];
    self.timeIntput = 0;
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"TimerButtons will deactivate");
    NSLog(@"%i", _timeIntput);
}

@end
