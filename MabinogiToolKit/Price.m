
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
    @"バンホール 酒場", @"センマイ平原 穴蔵の跡", @"イメンマハ 武器店の裏通り", 
    @"ケオ島", @"イメンマハ 南方向中間の島", @"センマイ平原三叉路西の廃屋",
    @"ドラゴン遺跡 東南の家", @"バンホール バリダンジョンそば", @"ダンバートン 学校前",
    @"トゥガルドアイルキャンプ北側付近", @"ティルコネイル 旅館", @"トゥガルドアイルキャンプ北側付近",
    @"ダンバートン東 じゃがいも畑の天幕", @"ドラゴン遺跡 東の家", 
    nil];
}


@end
