//
//  Event.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "Event.h"
#import "MeetupAPIClient.h"

@implementation Event

+ (void)getUpcomingEventsOnSuccess:(void (^)(NSArray *events))successBlock
                         onFailure:(void (^)(NSError *error))errorBlock
{
    //http://api.meetup.com/2/open_events?status=upcoming&radius=25.0&state=ny&and_text=False&limited_events=False&text=mobile&desc=False&city=New+York&offset=0&format=json&page=10&sig_id=8212264&sig=06ac377d2f98d72bdfeccb37b28aa6022b88cd7fH
    
    NSDictionary *params = @{@"status" : @"upcoming",
                             @"radius" : @50.0,
                             @"state" : @"NY",
                             @"and_text" : @"false",
                             @"limited_events" : @"false",
                             @"text" : @"mobile",
                             @"desc" : @"false",
                             @"city" : @"New York",
                             @"offset" : @0,
                             @"format" : @"json",
                             @"page" : @11,
                             @"sign" : @"true",
                             @"key" : kMeetupAPIKey};
    
    [[MeetupAPIClient sharedClient] getPath:@"/2/open_events"
                                 parameters:params
                                    success:^(AFHTTPRequestOperation *operation, id JSON) {
                                        NSArray *results = [JSON valueForKeyPath:@"results"];
                                        NSMutableArray *events = [NSMutableArray arrayWithCapacity:[results count]];
                                        
                                        for (NSDictionary *attributes in results) {
                                             Event *event = [[Event alloc] initWithAttributes:attributes];
                                             [events addObject:event];
                                         }

                                         if (successBlock) {
                                             successBlock([NSArray arrayWithArray:events]);
                                         }
                                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                                             if (block) {
//                                                 block([NSArray array], error);
//                                             }
                                    }];
}

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (self) {
        self.eventID = [attributes objectForKey:@"id"];
        self.eventName = [attributes objectForKey:@"name"];
        self.groupName = [[attributes objectForKey:@"group"] objectForKey:@"name"];
        self.rsvp = [attributes objectForKey:@"yes_rsvp_count"];
        self.eventTime = [attributes objectForKey:@"time"];
        self.utcOffset = [attributes objectForKey:@"utc_offset"];
        self.isFavorite = NO;
    }
    
    return self;
}

@end
