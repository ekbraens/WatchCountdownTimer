//
//  SecondsSelectionInterfaceCtrlr.m
//  WatchCountdownTimer
//
//  Created by New on 12/14/14.
//  Copyright (c) 2014 Braen. All rights reserved.
//

#import "SecondsSelectionInterfaceCtrlr.h"
#import "SecChooserATableRowCtrlr.h"

@interface SecondsSelectionInterfaceCtrlr()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;
@property (nonatomic, strong) SecChooserATableRowCtrlr *theRow;
@property (nonatomic, strong) NSMutableArray *allSeconds;

@property (assign) int numOfChoices;
@property (nonatomic, strong) NSMutableString *arrayAssigner;

@end

@implementation SecondsSelectionInterfaceCtrlr

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        self.numOfChoices = 60;
        self.allSeconds = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < _numOfChoices; ++i)
        {
            _arrayAssigner = [NSMutableString stringWithFormat:@"%i", i];
            _allSeconds[i] = _arrayAssigner;
        }
        
        NSLog(@"%@ initWithContext", self);
        
        [self configureTableWithData:_allSeconds];
    }
    return self;
}

- (void)configureTableWithData:(NSArray*)dataObjects
{
    // row type specified in storyboard, dont forget
    [self.table setNumberOfRows:[dataObjects count] withRowType:@"SecondsController"];
    
    for (NSInteger i = 0; i < [dataObjects count]; i++)
    {
        // custom class, imported and used as row controller
        _theRow = [self.table rowControllerAtIndex:i];
        
        [_theRow.SecLabel setText:[NSString stringWithFormat:@"%@ seconds", dataObjects[i]]];
        //[_theRow.SecLabel setText:dataObjects[i]];
    }
}

- (instancetype) contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex
{
    NSUserDefaults * secondsTransfer = [[NSUserDefaults alloc] init];
    NSString *_totalValue = [self.allSeconds objectAtIndex:rowIndex];
    int i = [_totalValue intValue];
    [secondsTransfer setDouble:i forKey:@"secondsTransfer"];
    
    //return [self.allMinutes objectAtIndex:rowIndex];
    return 0;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate, dumbass", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}


@end
