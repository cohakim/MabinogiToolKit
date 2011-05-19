
#import <Foundation/Foundation.h>

typedef enum {
  ErinnWeekImbolic     = 1, ErinnWeekAlbanEiler = 2, ErinnWeekBeltane    = 3,
  ErinnWeekAlbanHeruin = 4, ErinnWeekLughnasadh = 5, ErinnWeekAlbanElved = 6, 
  ErinnWeekSamhain     = 7
} ErinnWeek;

@interface ErinnTime : NSObject {
}
+ (ErinnWeek)currentErinnWeek;
+ (NSString*)symbolForErinnWeek:(ErinnWeek)week;
+ (NSString*)currentErinnTime;
@end
