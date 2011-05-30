
#import "MoonGate.h"

const NSInteger kMoomGateGap = 10;

@interface MoonGate ()
+ (NSArray*)gateNames;
@end

@implementation MoonGate

#pragma mark -
#pragma mark Public Methods

+ (NSArray*)timeTable:(NSRange)range {
  NSMutableArray *table = [NSMutableArray array];
  for (int i = 0; i < range.length; i++) {
    [table addObject:[self gateAtCycleCount:(range.location + i)]];
  }
  return table;
}

+ (NSDictionary*)gateAtCycleCount:(NSInteger)cycleCount {
  NSString *gateName = [self.gateNames objectAtIndex:((cycleCount+kMoomGateGap) % [self.gateNames count])];
  NSDate *openTime = [[NSDate dateWithTimeIntervalSince1970:0] dateByAddingTimeInterval:((cycleCount * 60 * 36) - (60 * 9))];
  return [NSDictionary dictionaryWithObjectsAndKeys:
          gateName, @"gateName",
          openTime, @"openTime",
          nil];
}

+ (BOOL)isGateOpen {
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

+ (NSArray*)gateNames {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Port Ceann", nil), NSLocalizedString(@"Bangor", nil),
          NSLocalizedString(@"Emain Macha", nil), NSLocalizedString(@"Tara", nil), 
          NSLocalizedString(@"Tir Chonaill", nil), NSLocalizedString(@"Taillteann", nil),
          NSLocalizedString(@"Ceo Island", nil), NSLocalizedString(@"Emain Macha", nil),
          NSLocalizedString(@"Tara", nil), NSLocalizedString(@"Bangor", nil),
          NSLocalizedString(@"Dunbarton", nil), NSLocalizedString(@"Port Ceann", nil),
          NSLocalizedString(@"Tara", nil), NSLocalizedString(@"Taillteann", nil), 
          NSLocalizedString(@"Tir Chonaill", nil), NSLocalizedString(@"Dunbarton", nil),
          NSLocalizedString(@"Bangor", nil), NSLocalizedString(@"Tara", nil), 
          NSLocalizedString(@"Ceo Island", nil), NSLocalizedString(@"Tir Chonaill", nil),
          NSLocalizedString(@"Taillteann", nil), NSLocalizedString(@"Emain Macha", nil),
          NSLocalizedString(@"Tara", nil), NSLocalizedString(@"Dunbarton", nil),
          nil];
}

@end
