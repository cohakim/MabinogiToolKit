
#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "ErinnTime.h"
#import "WeekEffect.h"
#import "TodaysMission.h"

@interface DailyEffectsViewController : UIViewController <UITableViewDelegate, RKObjectLoaderDelegate> {
 @private
  IBOutlet UITableView *effectView;
  NSTimer *timer;
  NSArray *effectExplanations;
  NSArray *itemExplanations;
  NSArray *missionExplanations;
}
@property (nonatomic, retain) UITableView *effectView;
@property (nonatomic, assign) NSTimer *timer;
@property (nonatomic, copy) NSArray *effectExplanations;
@property (nonatomic, copy) NSArray *itemExplanations;
@property (nonatomic, copy) NSArray *missionExplanations;
@end
