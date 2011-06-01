
#import "TodaysMission.h"

@implementation TodaysMission

@synthesize text = _text;
@synthesize createdAt = _createdAt;

#pragma mark -
#pragma mark Public Methods

- (BOOL)missionExpired {
  NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
  [formatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
  NSDate *missionCreatedAt = [formatter dateFromString:self.createdAt];
  NSDate *yesterday = [NSDate dateWithTimeIntervalSinceNow:(60*60*-24)];
  BOOL expired = [yesterday compare:missionCreatedAt] == NSOrderedDescending ? YES : NO;
  return expired;
}


#pragma mark -
#pragma mark Mapping Methods

+ (NSDictionary*)elementToPropertyMappings {
	return [NSDictionary dictionaryWithKeysAndObjects:
          @"text",      @"text",
          @"created_at", @"createdAt",
          nil];
}

@end
