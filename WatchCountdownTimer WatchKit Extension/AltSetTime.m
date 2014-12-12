//
//  AltSetTime.m
//  WatchCountdownTimer
//
//  Created by New on 12/9/14.
//  Copyright (c) 2014 Braen. All rights reserved.
//

#import "AltSetTime.h"
#import "MinChooserATableRowCtrlr.h"
#import "SecChooserATableRowCtrlr.h"

@interface AltSetTime()

@property (nonatomic, weak) IBOutlet WKInterfaceTable * minTable;

@property (nonatomic, strong) NSMutableArray * minArray;
@property (nonatomic, strong) NSMutableArray * secArray;
@property (nonatomic, strong) NSMutableString * arrayAssigner;

@end

@implementation AltSetTime

- (instancetype)initWithContext:(id)context
{
    self = [super initWithContext:context];
    if (self)
    {
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        _arrayAssigner = [[NSMutableString alloc] init];
        
        _minArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100; ++i)
        {
            _arrayAssigner = [NSMutableString stringWithFormat:@"%i", i];
            _minArray[i] = _arrayAssigner;
        }
        
        _secArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 60; ++i)
        {
            _arrayAssigner = [NSMutableString stringWithFormat:@"%i", i];
            _secArray[i] = _arrayAssigner;
        }
        
    }
    return self;
}

- (void)configureBothTables {
    NSArray *rowTypes = [[NSArray alloc] initWithObjects:@"MinutesToucher", @"SecondsToucher", nil];
    [self.minTable setRowTypes:rowTypes];
    for (int i = 0; i < [self.minArray count]; i++)
    {
        MinChooserATableRowCtrlr * theRow = [self.minTable rowControllerAtIndex:0];
        [theRow.minLabel setText:_minArray[i]];
    }
    for (int i = 0; i < [self.secArray count]; i++)
    {
        SecChooserATableRowCtrlr * theRow = [self.minTable rowControllerAtIndex:1];
        [theRow.SecLabel setText:_secArray[i]];
    }
}

- (void)configureMinTableWithData {
    NSArray *rowTypes = [[NSArray alloc] initWithObjects:@"MinutesToucher", @"SecondsToucher", nil];
    [self.minTable setRowTypes:rowTypes];
    [self.minTable setNumberOfRows:[_minArray count] withRowType:@"MinutesToucher"];
    for (NSInteger i = 0; i < self.minTable.numberOfRows; i++) {
        MinChooserATableRowCtrlr * theRow = [self.minTable rowControllerAtIndex:0];
        theRow = [self.minTable rowControllerAtIndex:i];
        
        [theRow.minLabel setText:_minArray[i]];
    }
}
- (void)configureSecTableWithData {
    NSArray *rowTypes = [[NSArray alloc] initWithObjects:@"MinutesToucher", @"SecondsToucher", nil];
    [self.minTable setRowTypes:rowTypes];
    [self.minTable setNumberOfRows:[_secArray count] withRowType:@"SecondsToucher"];
    for (NSInteger i = 0; i < self.minTable.numberOfRows; i++) {
        SecChooserATableRowCtrlr * theRow = [self.minTable rowControllerAtIndex:1];
        theRow = [self.minTable rowControllerAtIndex:i];
        
        [theRow.SecLabel setText:_secArray[i]];
    }
}

/* old method not working
- (void)configureSecTableWithData {
    [self.secTable setNumberOfRows:[_secArray count] withRowType:@"SecondsToucher"];
    for (NSInteger i = 0; i < self.secTable.numberOfRows; i++) {
        SecChooserATableRowCtrlr * theRow = [self.secTable rowControllerAtIndex:i];
     
        [theRow.secLabel setText:_secArray[i]];
    }
}
*/
- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    //[self configureMinTableWithData];
    //[self configureSecTableWithData];
    
    [self configureBothTables];
    
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}


@end
