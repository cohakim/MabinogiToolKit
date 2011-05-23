
#import <UIKit/UIKit.h>
#import "Rua.h"

@interface RuaViewController : UIViewController <UITableViewDelegate> {
 @private
  IBOutlet UITableView *ruaView;
  NSTimer *timer;
  NSArray *ruaTimeTable;
}
@property (nonatomic, retain) UITableView *ruaView;
@property (nonatomic, assign) NSTimer *timer;
@property (nonatomic, copy) NSArray *ruaTimeTable;
@end
