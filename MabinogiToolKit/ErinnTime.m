
#import "ErinnTime.h"

@interface ErinnTime ()
@end

@implementation ErinnTime

#pragma mark -
#pragma mark Public Methods

+ (ErinnWeek)currentErinnWeek {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSDateComponents *c = [calendar components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
  return [c weekday];
}

+ (NSString*)currentErinnTime {
  NSDate *currentErinnTime = [NSDate dateWithTimeIntervalSince1970:([[NSDate date] timeIntervalSince1970] * 40)];
  
  NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
  [formatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"US"] autorelease]];
	[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];

  [formatter setDateFormat:@"HH"];
  NSString *hh = [formatter stringFromDate:currentErinnTime];
  [formatter setDateFormat:@"mm"];
  NSString *mm = [formatter stringFromDate:currentErinnTime];
  
//  return [NSString stringWithFormat:@"%@:%@%@", hh, [mm substringToIndex:1], @"0"];
  return [NSString stringWithFormat:@"%@:%@", hh, mm];
}

+ (NSString*)symbolForErinnWeek:(ErinnWeek)week {
  NSString *symbol;
  switch (week) {
    case ErinnWeekImbolic:
      symbol = @"Imbolic";
      break;
    case ErinnWeekAlbanEiler:
      symbol = @"Alban Eiler";
      break;
    case ErinnWeekBeltane:
      symbol = @"Beltane";
      break;
    case ErinnWeekAlbanHeruin:
      symbol = @"Alban Heruin";
      break;
    case ErinnWeekLughnasadh:
      symbol = @"Lughnasadh";
      break;
    case ErinnWeekAlbanElved:
      symbol = @"Alban Elved";
      break;
    case ErinnWeekSamhain:
      symbol = @"Samhain";
      break;
  }
  return symbol;
}

@end
