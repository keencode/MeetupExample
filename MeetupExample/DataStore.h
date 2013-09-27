//
//  DataStore.h
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/27/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface DataStore : NSObject

@property (nonatomic, strong) NSMutableArray *allEvents;

+ (DataStore *)sharedInstance;

- (Event *)fetchEventWithID:(NSString *)eventID;

@end
