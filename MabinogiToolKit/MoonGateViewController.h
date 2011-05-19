
#import <UIKit/UIKit.h>
#import "MoonGate.h"

@interface MoonGateViewController : UIViewController <UITableViewDelegate> {
 @private
  IBOutlet UITableView *gateView;
  NSTimer *timer;
  NSArray *gateTimeTable;
}
@property (nonatomic, retain) UITableView *gateView;
@property (nonatomic, assign) NSTimer *timer;
@property (nonatomic, copy) NSArray *gateTimeTable;
@end
