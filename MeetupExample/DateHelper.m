//
//  DateHelper.m
//  MeetupExample
//
//  Created by Yee Peng Chia on 9/26/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper

+ (NSTimeInterval)eventTimeIntervalFromNumber:(NSNumber *)eventTime
{
    double timeInterval = [eventTime doubleValue] / 1000;
    return (NSTimeInterval)timeInterval;
}

+ (NSInteger)utcOffsetAsIntegerFromNumber:(NSNumber *)utcOffset
{
    double offset = [utcOffset doubleValue] / 1000;
    return (NSInteger)offset;
}

+ (NSString *)localEventTimeFromUTCTime:(NSNumber *)eventTime withOffset:(NSNumber *)utcOffset
{
    NSTimeInterval eventTimeInterval = [DateHelper eventTimeIntervalFromNumber:eventTime];
    NSInteger offsetInteger = [DateHelper utcOffsetAsIntegerFromNumber:utcOffset];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd hh:mm a EE";
    
    NSTimeZone *timezone = [NSTimeZone timeZoneForSecondsFromGMT:offsetInteger];
    [dateFormatter setTimeZone:timezone];

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:eventTimeInterval];
    NSString *timeStamp = [dateFormatter stringFromDate:date];
    return timeStamp;
}

+ (NSString *)dateStringFromUTCTime:(NSNumber *)eventTime withOffset:(NSNumber *)utcOffset
{
    NSString *timeStamp = [DateHelper localEventTimeFromUTCTime:eventTime withOffset:utcOffset];
    NSRange range = NSMakeRange (8, 2);
    return [timeStamp substringWithRange:range];
}

+ (NSString *)dayStringFromUTCTime:(NSNumber *)eventTime withOffset:(NSNumber *)utcOffset
{
    NSString *timeStamp = [DateHelper localEventTimeFromUTCTime:eventTime withOffset:utcOffset];
    return [timeStamp substringFromIndex:20];
}

+ (NSString *)monthStringFromUTCTime:(NSNumber *)eventTime withOffset:(NSNumber *)utcOffset
{
    NSString *timeStamp = [DateHelper localEventTimeFromUTCTime:eventTime withOffset:utcOffset];
    NSRange range = NSMakeRange (5, 2);
    NSString *month = [timeStamp substringWithRange:range];
    
    if ([month isEqualToString:@"01"]) {
        return @"JAN";
    } else if ([month isEqualToString:@"02"]) {
        return @"FEB";
    } else if ([month isEqualToString:@"03"]) {
        return @"MAR";
    } else if ([month isEqualToString:@"04"]) {
        return @"APR";
    } else if ([month isEqualToString:@"05"]) {
        return @"MAY";
    } else if ([month isEqualToString:@"06"]) {
        return @"JUN";
    } else if ([month isEqualToString:@"07"]) {
        return @"JUL";
    } else if ([month isEqualToString:@"08"]) {
        return @"AUG";
    } else if ([month isEqualToString:@"09"]) {
        return @"SEP";
    } else if ([month isEqualToString:@"10"]) {
        return @"OCT";
    } else if ([month isEqualToString:@"11"]) {
        return @"NOV";
    } else if ([month isEqualToString:@"12"]) {
        return @"DEC";
    }
    return nil;
}

+ (NSString *)timeStringFromUTCTime:(NSNumber *)eventTime withOffset:(NSNumber *)utcOffset
{
    NSString *timeStamp = [DateHelper localEventTimeFromUTCTime:eventTime withOffset:utcOffset];
    NSRange hourRange = NSMakeRange (11, 2);
    NSString *hour = [timeStamp substringWithRange:hourRange];
    
    NSRange minRange = NSMakeRange (14, 5);
    NSString *minAMPM = [timeStamp substringWithRange:minRange];
    
    if ([[hour substringWithRange:NSMakeRange (0, 1)] isEqualToString:@"0"]) {
        hour = [hour substringFromIndex:1];
    }
    
    return [NSString stringWithFormat:@"%@:%@", hour, minAMPM];
}

@end
