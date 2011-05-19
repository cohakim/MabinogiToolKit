
#import <UIKit/UIKit.h>
#import "ErinnTime.h"
#import "WeekEffect.h"

@interface WeekEffectViewController : UIViewController <UITableViewDelegate> {
 @private
  IBOutlet UITableView *effectView;
  NSTimer *timer;
  NSArray *effectExplanations;
  NSArray *itemExplanations;
}
@property (nonatomic, retain) UITableView *effectView;
@property (nonatomic, assign) NSTimer *timer;
@property (nonatomic, copy) NSArray *effectExplanations;
@property (nonatomic, copy) NSArray *itemExplanations;
@end
