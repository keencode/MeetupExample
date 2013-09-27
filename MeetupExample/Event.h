//
//  Event.h
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic, copy) NSString *eventID;
@property (nonatomic, copy) NSString *eventName;
@property (nonatomic, copy) NSString *groupName;
@property (nonatomic, copy) NSNumber *eventTime;
@property (nonatomic, copy) NSNumber *utcOffset;
@property (nonatomic, copy) NSNumber *rsvp;
@property (assign) BOOL isFavorite;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
