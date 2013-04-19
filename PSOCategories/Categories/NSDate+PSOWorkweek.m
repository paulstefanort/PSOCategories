//
//  NSDate+PSOWorkweek.m
//  PSOCategories
//
//  Created by Paul Stefan Ort on 4/17/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import "NSDate+PSOWorkweek.h"

#define SATURDAY 7
#define SUNDAY 1

@implementation NSDate (PSOWorkweek)

- (BOOL)isWeekday {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit) fromDate:self];
    NSInteger weekDay = [dateComponents weekday];
    
    if (weekDay == SATURDAY || weekDay == SUNDAY) {
        return false;
    }
    return true;
}

- (NSDate *)nextWeekday {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *oneDayComponents = [NSDateComponents new];
    oneDayComponents.day = 1;
    NSDateComponents *twoDayComponents = [NSDateComponents new];
    twoDayComponents.day = 2;
    
    // begin by adding one day
    NSDate *date = [calendar dateByAddingComponents:oneDayComponents toDate:self options:0];
    
    NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit) fromDate:date];
    NSInteger weekDay = [dateComponents weekday];
    
    if (weekDay == SATURDAY) {
        // add two days
        date = [calendar dateByAddingComponents:twoDayComponents toDate:date options:0];
    } else if (weekDay == SUNDAY) {
        // add one day
        date = [calendar dateByAddingComponents:oneDayComponents toDate:date options:0];
    }
    return date;
}

- (NSDate *)previousWeekday {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *oneDayComponents = [NSDateComponents new];
    oneDayComponents.day = -1;
    NSDateComponents *twoDayComponents = [NSDateComponents new];
    twoDayComponents.day = -2;
    
    // begin by subtracting one day
    NSDate *date = [calendar dateByAddingComponents:oneDayComponents toDate:self options:0];
    
    NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit) fromDate:date];
    NSInteger weekDay = [dateComponents weekday];
    
    if (weekDay == SATURDAY) {
        // subtract one day
        date = [calendar dateByAddingComponents:oneDayComponents toDate:date options:0];
    } else if (weekDay == SUNDAY) {
        // subtract two days
        date = [calendar dateByAddingComponents:twoDayComponents toDate:date options:0];
    }
    return date;
}

@end
