//
//  DataStore.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/27/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "DataStore.h"

@implementation DataStore

+ (DataStore *)sharedInstance
{
    static DataStore *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[DataStore alloc] init];
        _sharedInstance.allEvents = [NSMutableArray array];
    });
    
    return _sharedInstance;
}

- (Event *)fetchEventWithID:(NSString *)eventID
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"eventID == %@", eventID];
    NSArray *results = [self.allEvents filteredArrayUsingPredicate:predicate];
    
    if (results) {
        return [results lastObject];
    }
    
    return nil;
}

@end
