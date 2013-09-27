//
//  Event+NetworkHelper.h
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "Event.h"

extern NSString const * kEventsErrorDomain;

typedef enum {
    kInvalidStatusCode,
    kInvalidJSONResponse
} EventsNetworkErrorCode;

@interface Event (NetworkHelper)

+ (void)getUpcomingEventsOnSuccess:(void (^)(NSArray *events))successBlock
                         onFailure:(void (^)(NSError *error))errorBlock;

+ (void)searchUpcomingEventsWithTerms:(NSDictionary *)searchTerms
                             onSuccess:(void (^)(NSArray *events))successBlock
                             onFailure:(void (^)(NSError *error))errorBlock;

+ (void)eventsFromResponse:(NSDictionary *)response
                 onSuccess:(void (^)(NSArray *events))successBlock
                 onFailure:(void (^)(NSError *error))errorBlock;

- (void)addFavoriteOnSuccess:(void (^)(BOOL success))successBlock
                   onFailure:(void (^)(NSError *error))errorBlock;

- (void)removeFavoriteOnSuccess:(void (^)(BOOL success))successBlock
                      onFailure:(void (^)(NSError *error))errorBlock;

@end
