//
//  DateHelperTest.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DateHelper.h"

@interface DateHelperTest : SenTestCase

@end

@implementation DateHelperTest

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

- (void)testEventTimeInSecondsFromNumber
{
    NSNumber *eventTime = @1380211200000;
    NSTimeInterval expectedTimeInterval = 1380211200;
    
    NSTimeInterval timeInterval = [DateHelper eventTimeIntervalFromNumber:eventTime];
    
    STAssertEquals(timeInterval, expectedTimeInterval, @"timeInterval should be equal to expectedTimeInterval");
}

- (void)testUTCOffsetAsIntegerFromNumber
{
    NSNumber *utcOffset = @-25200000;
    NSInteger expectedOffset = -25200;
    
    NSInteger offsetInt = [DateHelper utcOffsetAsIntegerFromNumber:utcOffset];
    
    STAssertEquals(offsetInt, expectedOffset, @"offsetInt should be equal to expectedOffset");
}

- (void)testLocalEventTimeFromUTCTimeWithOffset
{
    NSNumber *eventTime = @1380211200000;
    NSNumber *utcOffset = @-25200000;
    NSString *expectedTime = @"2013-09-26 09:00 AM Thu";
    
    NSString *localTime = [DateHelper localEventTimeFromUTCTime:eventTime withOffset:utcOffset];

    STAssertEqualObjects(localTime, expectedTime, @"localTime should match expectedTime");
}

- (void)testDateStringFromUTCTimeWithOffset
{
    NSNumber *eventTime = @1380211200000;
    NSNumber *utcOffset = @-25200000;
    NSString *expectedDate = @"26";
    
    NSString *eventDate = [DateHelper dateStringFromUTCTime:eventTime withOffset:utcOffset];
    
    STAssertEqualObjects(eventDate, expectedDate, @"eventDate should match expectedDate");
}

- (void)testDayStringFromUTCTimeWithOffset
{
    NSNumber *eventTime = @1380211200000;
    NSNumber *utcOffset = @-25200000;
    NSString *expectedDay = @"Thu";
    
    NSString *eventDay = [DateHelper dayStringFromUTCTime:eventTime withOffset:utcOffset];
    STAssertEqualObjects(eventDay, expectedDay, @"eventDay should match expectedDay");
}

- (void)testMonthStringFromUTCTimeWithOffset
{
    NSNumber *eventTime = @1380211200000;
    NSNumber *utcOffset = @-25200000;
    NSString *expectedMonth = @"SEP";
    
    NSString *month = [DateHelper monthStringFromUTCTime:eventTime withOffset:utcOffset];
    STAssertEqualObjects(month, expectedMonth, @"month should match expectedMonth");
}

- (void)testTimeStringFromUTCTimeWithOffset
{
    NSNumber *eventTime = @1380211200000;
    NSNumber *utcOffset = @-25200000;
    NSString *expectedTime = @"9:00 AM";
    
    NSString *timeStr = [DateHelper timeStringFromUTCTime:eventTime withOffset:utcOffset];
    STAssertEqualObjects(timeStr, expectedTime, @"timeStr should match expectedTime");
}

@end
