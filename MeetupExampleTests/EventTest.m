//
//  EventTest.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/27/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Event.h"
#import "Event+NetworkHelper.h"

@interface EventTest : SenTestCase
{
    NSDictionary *eventDict;
}

@end

@implementation EventTest

- (void)setUp
{
    [super setUp];
    
    eventDict = @{@"id" : @"141991972",
                @"name" : @"HTML5 Application Development Class - IT Training",
                @"time" : @1380211200000,
                @"utc_offset" : @-25200000,
                @"yes_rsvp_count" : @3,
                @"group" : @{@"name" : @"Startup Saturdays"}};
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInitWithAttributesShouldAssignCorrectEventID
{
    Event *event = [[Event alloc] initWithAttributes:eventDict];
    
    STAssertEqualObjects(event.eventID, [eventDict objectForKey:@"id"], @"eventID should match the id attribute");
}

- (void)testInitWithAttributesShouldAssignCorrectEventName
{
    Event *event = [[Event alloc] initWithAttributes:eventDict];
    
    STAssertEqualObjects(event.eventName, [eventDict objectForKey:@"name"], @"eventName should match the name attribute");
}

- (void)testInitWithAttributesShouldAssignCorrectEventTime
{
    Event *event = [[Event alloc] initWithAttributes:eventDict];
    
    STAssertEqualObjects(event.eventTime, [eventDict objectForKey:@"time"], @"eventTime should match the time attribute");
    STAssertEqualObjects(event.utcOffset, [eventDict objectForKey:@"utc_offset"], @"utcOffset should match the utc_offset attribute");
    STAssertEqualObjects(event.rsvp, [eventDict objectForKey:@"yes_rsvp_count"], @"rsvp should match the yes_rsvp_count attribute");
    STAssertEqualObjects(event.groupName, [[eventDict objectForKey:@"group"] objectForKey:@"name"], @"groupName should match the name of the group attribute");
}

- (void)testInitWithAttributesShouldAssignCorrectUTCOffset
{
    Event *event = [[Event alloc] initWithAttributes:eventDict];
    
    STAssertEqualObjects(event.utcOffset, [eventDict objectForKey:@"utc_offset"], @"utcOffset should match the utc_offset attribute");
    STAssertEqualObjects(event.rsvp, [eventDict objectForKey:@"yes_rsvp_count"], @"rsvp should match the yes_rsvp_count attribute");
    STAssertEqualObjects(event.groupName, [[eventDict objectForKey:@"group"] objectForKey:@"name"], @"groupName should match the name of the group attribute");
}

- (void)testInitWithAttributesShouldAssignCorrectRSVPCount
{
    Event *event = [[Event alloc] initWithAttributes:eventDict];
    
    STAssertEqualObjects(event.rsvp, [eventDict objectForKey:@"yes_rsvp_count"], @"rsvp should match the yes_rsvp_count attribute");
    STAssertEqualObjects(event.groupName, [[eventDict objectForKey:@"group"] objectForKey:@"name"], @"groupName should match the name of the group attribute");
}

- (void)testInitWithAttributesShouldAssignCorrectGroupName
{
    Event *event = [[Event alloc] initWithAttributes:eventDict];
    
    STAssertEqualObjects(event.groupName, [[eventDict objectForKey:@"group"] objectForKey:@"name"], @"groupName should match the name of the group attribute");
}

- (void)testDefaultIsFavoriteShouldBeNO
{
    Event *event = [[Event alloc] initWithAttributes:eventDict];
    
    STAssertEquals(event.isFavorite, NO, @"isFavorite should be NO");
}

- (void)testAddFavoriteShouldReturnYES
{
    Event *event = [[Event alloc] initWithAttributes:eventDict];
    
    __block id weakRef = event;
    
    [event addFavoriteOnSuccess:^(BOOL success) {
        STAssertTrue([(Event *)weakRef isFavorite] == YES, @"isFavorite should be YES after it has been added");
    } onFailure:^(NSError *error) {
        //
    }];
}

- (void)testRemoveFavoriteShouldReturnNO
{
    Event *event = [[Event alloc] initWithAttributes:eventDict];
    
    __block id weakRef = event;
    
    [event removeFavoriteOnSuccess:^(BOOL success) {
        STAssertTrue([(Event *)weakRef isFavorite] == NO, @"isFavorite should be NO after it has been added");
    } onFailure:^(NSError *error) {
        //
    }];
}

@end
