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
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:(NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit) fromDate:self];
    NSInteger weekDay = [dateComponents weekday];
    
    if (weekDay == SATURDAY || weekDay == SUNDAY) {
        return false;
    }
    return true;
}

- (NSDate *)nextWeekday {
    NSDateComponents *oneDayComponents = [NSDateComponents new];
    oneDayComponents.day = 1;
    NSDateComponents *twoDayComponents = [NSDateComponents new];
    twoDayComponents.day = 2;
    
    // begin by adding one day
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:oneDayComponents toDate:self options:0];
    
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:(NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit) fromDate:date];
    NSInteger weekDay = [dateComponents weekday];
    
    if (weekDay == SATURDAY) {
        // add two days
        date = [[NSCalendar currentCalendar] dateByAddingComponents:twoDayComponents toDate:date options:0];
    } else if (weekDay == SUNDAY) {
        // add one day
        date = [[NSCalendar currentCalendar] dateByAddingComponents:oneDayComponents toDate:date options:0];
    }
    return date;
}

- (NSDate *)previousWeekday {
    NSDateComponents *oneDayComponents = [NSDateComponents new];
    oneDayComponents.day = -1;
    NSDateComponents *twoDayComponents = [NSDateComponents new];
    twoDayComponents.day = -2;
    
    // begin by subtracting one day
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:oneDayComponents toDate:self options:0];
    
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:(NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit) fromDate:date];
    NSInteger weekDay = [dateComponents weekday];
    
    if (weekDay == SATURDAY) {
        // subtract one day
        date = [[NSCalendar currentCalendar] dateByAddingComponents:oneDayComponents toDate:date options:0];
    } else if (weekDay == SUNDAY) {
        // subtract two days
        date = [[NSCalendar currentCalendar] dateByAddingComponents:twoDayComponents toDate:date options:0];
    }
    return date;
}

@end
