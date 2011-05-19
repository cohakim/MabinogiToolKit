
#import <UIKit/UIKit.h>
#import "Price.h"

@interface PriceViewController : UIViewController <UITableViewDelegate> {
 @private
  IBOutlet UITableView *priceView;
  NSTimer *timer;
  NSArray *priceTimeTable;
}
@property (nonatomic, retain) UITableView *priceView;
@property (nonatomic, assign) NSTimer *timer;
@property (nonatomic, copy) NSArray *priceTimeTable;
@end
