//
//  Event.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "Event.h"

@implementation Event

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (self) {
        self.eventID = [attributes objectForKey:@"id"];
        NSLog(@"eventID: %@", self.eventID);
        self.isFavorite = NO;
        
        [self updateWithAttributes:attributes];
    }
    
    return self;
}

- (void)updateWithAttributes:(NSDictionary *)attributes
{
    self.eventName = [attributes objectForKey:@"name"];
    NSLog(@"eventName: %@", self.eventName);
    self.groupName = [[attributes objectForKey:@"group"] objectForKey:@"name"];
    self.rsvp = [attributes objectForKey:@"yes_rsvp_count"];
    self.eventTime = [attributes objectForKey:@"time"];
    self.utcOffset = [attributes objectForKey:@"utc_offset"];
}

@end
