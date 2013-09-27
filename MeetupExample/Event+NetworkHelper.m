//
//  Event+NetworkHelper.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "Event+NetworkHelper.h"
#import "MeetupAPIClient.h"

@implementation Event (NetworkHelper)

NSString const * kEventsErrorDomain = @"events.error.meetup.com";

+ (void)getUpcomingEventsOnSuccess:(void (^)(NSArray *events))successBlock
                         onFailure:(void (^)(NSError *error))errorBlock
{
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
                             @"page" : @10,
                             @"sign" : @"true",
                             @"key" : kMeetupAPIKey};
    
    [[MeetupAPIClient sharedClient] getPath:@"/2/open_events"
                                 parameters:params
                                    success:^(AFHTTPRequestOperation *operation, id JSON) {
                                        if (JSON) {
                                            [self eventsFromResponse:JSON onSuccess:^(NSArray *events) {
                                                if (successBlock) {
                                                    successBlock(events);
                                                }
                                            } onFailure:^(NSError *error) {
                                                // Handle error;
                                            }];
                                        } else {
                                            // Handle error
                                        }
                                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                        if (errorBlock) {
                                            errorBlock(error);
                                        }
                                    }];
}

+ (void)eventsFromResponse:(NSDictionary *)response
                 onSuccess:(void (^)(NSArray *events))successBlock
                 onFailure:(void (^)(NSError *error))errorBlock
{
    NSArray *results = [response valueForKeyPath:@"results"];
    
    if ([results count] > 0) {
        NSMutableArray *events = [NSMutableArray arrayWithCapacity:[results count]];
        
        for (NSDictionary *attributes in results) {
            Event *event = [[Event alloc] initWithAttributes:attributes];
            [events addObject:event];
        }
        
        if (successBlock) {
            successBlock([NSArray arrayWithArray:events]);
        }
    } else {
        // Handle error
    }
}

- (void)addFavoriteOnSuccess:(void (^)(BOOL success))successBlock
                   onFailure:(void (^)(NSError *error))errorBlock
{
    self.isFavorite = YES;
    
    if (successBlock) {
        successBlock(YES);
    }
}

- (void)removeFavoriteOnSuccess:(void (^)(BOOL success))successBlock
                      onFailure:(void (^)(NSError *error))errorBlock
{
    self.isFavorite = NO;
    
    if (successBlock) {
        successBlock(YES);
    }
}

@end
