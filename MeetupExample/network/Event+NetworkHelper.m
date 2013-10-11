//
//  Event+NetworkHelper.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "Event+NetworkHelper.h"
#import "MeetupAPIClient.h"
#import "DataStore.h"

@implementation Event (NetworkHelper)

+ (void)getUpcomingEventsOnSuccess:(void (^)(NSArray *events))successBlock
                         onFailure:(void (^)(NSError *error))failureBlock
{
    NSDictionary *params = @{@"status" : @"upcoming",
                             @"radius" : @50.0,
                             @"state" : @"NY",
                             @"and_text" : @"false",
                             @"limited_events" : @"false",
                             @"topic" : @"social",
                             @"desc" : @"false",
                             @"city" : @"New York",
                             @"offset" : @0,
                             @"format" : @"json",
                             @"page" : @10,
                             @"sign" : @"true",
                             @"key" : kMeetupAPIKey};
    
    [Event getOpenEventsWithParams:params onSuccess:successBlock onFailure:failureBlock];
}

+ (void)searchUpcomingEventsWithTerms:(NSDictionary *)searchTerms
                            onSuccess:(void (^)(NSArray *events))successBlock
                            onFailure:(void (^)(NSError *error))failureBlock
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:searchTerms];
    
    NSDictionary *defaultParams = @{@"status" : @"upcoming",
                                    @"radius" : @50.0,
                                    @"and_text" : @"false",
                                    @"limited_events" : @"false",
                                    @"desc" : @"false",
                                    @"offset" : @0,
                                    @"format" : @"json",
                                    @"page" : @10,
                                    @"sign" : @"true",
                                    @"key" : kMeetupAPIKey};
    
    [params addEntriesFromDictionary:defaultParams];
    
    [Event getOpenEventsWithParams:params onSuccess:successBlock onFailure:failureBlock];
}

+ (void)getOpenEventsWithParams:(NSDictionary *)params
                      onSuccess:(void (^)(NSArray *events))successBlock
                      onFailure:(void (^)(NSError *error))failureBlock
{
    [[MeetupAPIClient sharedClient] getPath:@"/2/open_events"
                                 parameters:params
                                    success:^(AFHTTPRequestOperation *operation, id JSON) {
                                        if (JSON) {
                                            [self eventsFromResponse:JSON onSuccess:^(NSArray *events) {
                                                if (successBlock) {
                                                    successBlock(events);
                                                }
                                            } onFailure:^(NSError *error) {
                                                if (failureBlock) {
                                                    failureBlock(error);
                                                }
                                            }];
                                        } else {
                                            NSError *error = [NSError errorWithDomain:kEventsErrorDomain code:kInvalidJSONResponse userInfo:nil];
                                            if (failureBlock) {
                                                failureBlock(error);
                                            }
                                        }
                                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                        if (failureBlock) {
                                            failureBlock(error);
                                        }
                                    }];
}

+ (void)eventsFromResponse:(NSDictionary *)response
                 onSuccess:(void (^)(NSArray *events))successBlock
                 onFailure:(void (^)(NSError *error))failureBlock
{
    NSArray *results = [response valueForKeyPath:@"results"];
    
    if ([results count] > 0) {
        NSMutableArray *events = [NSMutableArray arrayWithCapacity:[results count]];
        
        for (NSDictionary *attributes in results) {
            NSString *eventID = [attributes objectForKey:@"id"];
            Event *event = [[DataStore sharedInstance] fetchEventWithID:eventID];
        
            if (!event) {
                event = [[Event alloc] initWithAttributes:attributes];
                [[DataStore sharedInstance].allEvents addObject:event];
            }
                            
            [events addObject:event];
        }
        
        if (successBlock) {
            successBlock([NSArray arrayWithArray:events]);
        }
    } else {
        NSError *error = [NSError errorWithDomain:kEventsErrorDomain code:kZeroEventsResults userInfo:nil];
        if (failureBlock) {
            failureBlock(error);
        }
    }
}

- (void)addFavoriteOnSuccess:(void (^)(BOOL success))successBlock
                   onFailure:(void (^)(NSError *error))failureBlock
{
    self.isFavorite = YES;
    
    if (successBlock) {
        successBlock(YES);
    }
}

- (void)removeFavoriteOnSuccess:(void (^)(BOOL success))successBlock
                      onFailure:(void (^)(NSError *error))failureBlock
{
    self.isFavorite = NO;
    
    if (successBlock) {
        successBlock(YES);
    }
}

@end
