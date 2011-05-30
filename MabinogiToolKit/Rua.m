
#import "Rua.h"

const NSInteger kAttendanceGap = 10;

@interface Rua ()
+ (NSArray*)attendances;
@end

@implementation Rua

#pragma mark -
#pragma mark Public Methods

+ (NSArray*)timeTable:(NSRange)range {
  NSMutableArray *table = [NSMutableArray array];
  for (int i = 0; i < range.length; i++) {
    [table addObject:[self attendanceAtCycleCount:(range.location + i)]];
  }
  return table;
}

+ (NSDictionary*)attendanceAtCycleCount:(NSInteger)cycleCount {
  NSString *attendance = [self.attendances objectAtIndex:((cycleCount + kAttendanceGap) % [self.attendances count])];
  NSDate *appearanceTime = 
    [[NSDate dateWithTimeIntervalSince1970:0] dateByAddingTimeInterval:((cycleCount * 60 * 36) - (60 * 9))];
  
  return [NSDictionary dictionaryWithObjectsAndKeys:
          attendance, @"attendance",
          appearanceTime, @"appearanceTime",
          nil];
}

+ (BOOL)isRuaAttendance {
  if (![[[self attendanceAtCycleCount:[self currentCycleCount]] objectForKey:@"attendance"] boolValue]) {
    return NO;
  }
  
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSDateComponents *comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                                        fromDate:[NSDate date]];
  NSDate *beginningOfToday = [calendar dateFromComponents:comps];
  NSInteger elapsedTime = ([[NSDate date] timeIntervalSinceDate:beginningOfToday]) * 40;
  
  return (elapsedTime / (60*60*6) % 4) == 0 || (elapsedTime / (60*60*6) % 4) == 3;
}

+ (NSInteger)currentCycleCount {
  long long int elapsedTime = ([[NSDate date] timeIntervalSince1970] + (60*27)) * 40;
  return elapsedTime / (60*60*24);
}

#pragma mark -
#pragma mark Private Methods

+ (NSArray*)attendances {
  int array[] = { 
    RuaIsAtWork, RuaIsAbsent, RuaIsAtWork, RuaIsAtWork, RuaIsAbsent,
    RuaIsAtWork, RuaIsAtWork, RuaIsAtWork, RuaIsAbsent, RuaIsAbsent,
    RuaIsAbsent, RuaIsAbsent, RuaIsAbsent, RuaIsAbsent, RuaIsAbsent,
    RuaIsAtWork, RuaIsAbsent, RuaIsAtWork, RuaIsAbsent, RuaIsAbsent,
    RuaIsAtWork, RuaIsAbsent, RuaIsAbsent, RuaIsAbsent, RuaIsAtWork,
    RuaIsAbsent, RuaIsAbsent, RuaIsAbsent, RuaIsAtWork, RuaIsAbsent,
    RuaIsAbsent, RuaIsAtWork, RuaIsAbsent, RuaIsAbsent, RuaIsAbsent,
    RuaIsAtWork, RuaIsAbsent, RuaIsAbsent, RuaIsAbsent, RuaIsAbsent,
    RuaIsAtWork, RuaIsAbsent, RuaIsAbsent 
  };
  NSMutableArray *attendances = [NSMutableArray array];
  for (int i = 0; i < (sizeof array /sizeof array[0]); i++) {
    [attendances addObject:[NSNumber numberWithBool:array[i]]];
  }
  return [NSArray arrayWithArray:attendances];
}

@end
