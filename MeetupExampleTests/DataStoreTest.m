//
//  DataStoreTest.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/27/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Event.h"
#import "DataStore.h"

@interface DataStoreTest : SenTestCase

@end

@implementation DataStoreTest

- (void)setUp
{
    [super setUp];
    
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testFetchEventWithIDReturnsValidEvent
{
    NSDictionary *eventDict = @{@"id" : @"141991972",
                                @"name" : @"HTML5 Application Development Class - IT Training",
                                @"time" : @1380211200000,
                                @"utc_offset" : @-25200000,
                                @"yes_rsvp_count" : @3,
                                @"group" : @{@"name" : @"Startup Saturdays"}};
    
    Event *newEvent = [[Event alloc] initWithAttributes:eventDict];
    DataStore *dataStore = [DataStore sharedInstance];
    [dataStore.allEvents addObject:newEvent];
    
    NSString *eventID = [eventDict objectForKey:@"id"];
    Event *fetchedEvent = [dataStore fetchEventWithID:eventID];
    STAssertEquals(fetchedEvent, newEvent, @"fetchedEvent should be equal to newEvent");
}

@end
