//
//  Event+NetworkHelper.h
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "Event.h"

#define kEventsErrorDomain @"events.error.meetup.com"

typedef enum {
    kInvalidStatusCode,
    kInvalidJSONResponse,
    kZeroEventsResults
} EventsNetworkErrorCode;

@interface Event (NetworkHelper)

+ (void)getUpcomingEventsOnSuccess:(void (^)(NSArray *events))successBlock
                         onFailure:(void (^)(NSError *error))failureBlock;

+ (void)searchUpcomingEventsWithTerms:(NSDictionary *)searchTerms
                            onSuccess:(void (^)(NSArray *events))successBlock
                            onFailure:(void (^)(NSError *error))failureBlock;

+ (void)getOpenEventsWithParams:(NSDictionary *)params
                      onSuccess:(void (^)(NSArray *events))successBlock
                      onFailure:(void (^)(NSError *error))failureBlock;

+ (void)eventsFromResponse:(NSDictionary *)response
                 onSuccess:(void (^)(NSArray *events))successBlock
                 onFailure:(void (^)(NSError *error))failureBlock;

- (void)addFavoriteOnSuccess:(void (^)(BOOL success))successBlock
                   onFailure:(void (^)(NSError *error))failureBlock;

- (void)removeFavoriteOnSuccess:(void (^)(BOOL success))successBlock
                      onFailure:(void (^)(NSError *error))failureBlock;

@end
