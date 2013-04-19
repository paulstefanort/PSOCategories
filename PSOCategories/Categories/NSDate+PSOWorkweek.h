//
//  NSDate+PSOWorkweek.h
//  PSOCategories
//
//  Created by Paul Stefan Ort on 4/17/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (PSOWorkweek)

- (BOOL)isWeekday;
- (NSDate *)nextWeekday;
- (NSDate *)previousWeekday;

@end
