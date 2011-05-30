
#import "Price.h"

const NSInteger kPlaceGap = 5;

@interface Price ()
+ (NSArray*)placeNames;
@end

@implementation Price

#pragma mark -
#pragma mark Public Methods

+ (NSArray*)timeTable:(NSRange)range {
  NSMutableArray *table = [NSMutableArray array];
  for (int i = 0; i < range.length; i++) {
    [table addObject:[self priceAtCycleCount:(range.location + i)]];
  }
  return table;
}

+ (NSDictionary*)priceAtCycleCount:(NSInteger)cycleCount {
  NSString *placeName = [self.placeNames objectAtIndex:((cycleCount + kPlaceGap) % [self.placeNames count])];
  NSDate *appearanceTime = [[NSDate dateWithTimeIntervalSince1970:0] dateByAddingTimeInterval:(cycleCount * 60 * 36)];
  
  return [NSDictionary dictionaryWithObjectsAndKeys:
          placeName, @"placeName",
          appearanceTime, @"appearanceTime",
          nil];
}

+ (NSInteger)currentCycleCount {
  long long int elapsedTime = [[NSDate date] timeIntervalSince1970] * 40;
  return elapsedTime / (60*60*24);
}

#pragma mark -
#pragma mark Private Methods

+ (NSArray*)placeNames {
  return [NSArray arrayWithObjects:
          NSLocalizedString(@"Bangor Bar", nil), NSLocalizedString(@"Sen Mag 5th house from West", nil), 
          NSLocalizedString(@"Emain Macha - Behind Weapon Shop", nil), NSLocalizedString(@"Ceo Island", nil), 
          NSLocalizedString(@"Emain Macha - Island in South Pathway", nil), NSLocalizedString(@"Sen Mag 5th house from West", nil),
          NSLocalizedString(@"Dragon Ruins - House at 5`o clock", nil), NSLocalizedString(@"Outside Barri Dungeon", nil),
          NSLocalizedString(@"Dunbarton School Stairway", nil), NSLocalizedString(@"Dugald Aisle Logging Camp Hut", nil),
          NSLocalizedString(@"Outside Tir Chonaill Inn", nil), NSLocalizedString(@"Dugald Aisle Logging Camp Hut", nil),
          NSLocalizedString(@"Dunbarton East Potato Field", nil), NSLocalizedString(@"Dragon Ruins - House at 5`o clock", nil),
          nil];
}


@end
