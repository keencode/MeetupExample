//
//  FirstViewControllerTest.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreLocation/CoreLocation.h>
#import "LocationHelper.h"

@interface FirstViewControllerTest : XCTestCase

@end

@implementation FirstViewControllerTest

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

- (void)testShouldRetrieveCurrentLocation
{
    LocationHelper *locationHelper = [[LocationHelper alloc] init];
    CLLocation *location = [locationHelper getCurrentLocation];
    
    XCTAssertNotNil(location, @"the current location should not be nil");
}

@end
