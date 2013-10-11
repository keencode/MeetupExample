//
//  DateHelper.h
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHelper : NSObject

+ (NSTimeInterval)eventTimeIntervalFromNumber:(NSNumber *)eventTime;

+ (NSInteger)utcOffsetAsIntegerFromNumber:(NSNumber *)utcOffset;

+ (NSString *)localEventTimeFromUTCTime:(NSNumber *)eventTime withOffset:(NSNumber *)utcOffset;

+ (NSString *)dateStringFromUTCTime:(NSNumber *)eventTime withOffset:(NSNumber *)utcOffset;

+ (NSString *)dayStringFromUTCTime:(NSNumber *)eventTime withOffset:(NSNumber *)utcOffset;

+ (NSString *)monthStringFromUTCTime:(NSNumber *)eventTime withOffset:(NSNumber *)utcOffset;

+ (NSString *)timeStringFromUTCTime:(NSNumber *)eventTime withOffset:(NSNumber *)utcOffset;

@end
