
#import <Foundation/Foundation.h>
#import "ErinnTime.h"

@interface WeekEffect : NSObject {
}
+ (NSArray*)effectsFor:(ErinnWeek)week;
+ (NSArray*)itemsFor:(ErinnWeek)week;
@end
