//
//  InterfaceController.h
//  WatchCountdownTimer WatchKit Extension
//
//  Created by New on 12/6/14.
//  Copyright (c) 2014 Braen. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import "TimerButtons.h"

// #3/4 import the header of the _delegate (above)
//      put the protocol ...Delgate inside the <> (below)
@interface InterfaceController : WKInterfaceController <TimerButtonsDelegate>

@end
