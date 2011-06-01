
#import "CreditViewController.h"

@interface CreditViewController ()
- (NSDictionary *)locations;
@end

@implementation CreditViewController

@synthesize timer;

#pragma mark -
#pragma mark Private Methods

- (NSDictionary *)locations {
  return [NSDictionary dictionaryWithObjectsAndKeys:
          [NSURL URLWithString:@"http://twitter.com/#!/cohakims_work"], @"cohakim",
          [NSURL URLWithString:@"http://0333.blog21.fc2.com/"], @"mabinya",
          [NSURL URLWithString:@"http://www.mabinogi.jp/"], @"nexon",
          nil];
}

#pragma mark -
#pragma mark Inherit Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.timer = [NSTimer scheduledTimerWithTimeInterval:600.0f
                                                target:self
                                              selector:@selector(fireTimerEvent)
                                              userInfo:nil
                                               repeats:YES];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
  [timer invalidate];
  [super viewDidUnload];
}

- (void)dealloc {
  self.timer = nil;
  [super dealloc];
}

#pragma mark -
#pragma mark Timer Event Handlers

- (void)fireTimerEvent {
  // NOTE: nothing
}

#pragma mark -
#pragma mark Touch Event Handlers

- (IBAction)visitMyTwitterButtonTouched:(id)sender {
  [[UIApplication sharedApplication] openURL:[self.locations objectForKey:@"cohakim"]];
}

- (IBAction)visitMabinyaButtonTouched:(id)sender {
  [[UIApplication sharedApplication] openURL:[self.locations objectForKey:@"mabinya"]];
}

- (IBAction)visitNexonButtonTouched:(id)sender {
  [[UIApplication sharedApplication] openURL:[self.locations objectForKey:@"nexon"]];
}

@end
