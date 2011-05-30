
#import "MoonGateViewController.h"

@interface MoonGateViewController ()
- (void)refreshTimeTable;
@end

@implementation MoonGateViewController

@synthesize gateView;
@synthesize timer;
@synthesize gateTimeTable;

#pragma mark -
#pragma mark Private Methods

- (void)refreshTimeTable {
  self.gateTimeTable = [MoonGate timeTable:NSMakeRange([MoonGate currentCycleCount], 12)];
  [gateView reloadData];
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
  [gateView setSeparatorColor:[UIColor blackColor]];
  self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                target:self
                                              selector:@selector(fireTimerEvent)
                                              userInfo:nil
                                               repeats:YES];
  [timer fire];  
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
  self.gateTimeTable = nil;
  [super dealloc];
}

#pragma mark -
#pragma mark Timer Event Handlers

- (void)fireTimerEvent {
  [self refreshTimeTable];
}

#pragma mark -
#pragma mark UITableView Delegate Methods

// -----------------------------------------------------------------------------
// section

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [gateTimeTable count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView *sectionView = [[[UIView alloc] init] autorelease];
	[sectionView setBackgroundColor:[UIColor colorWithHue:0.00 saturation:0.00 brightness:0.00 alpha:0.40]];
	UILabel *titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width, tableView.sectionHeaderHeight)] autorelease];
  [titleLabel setBackgroundColor:[UIColor colorWithHue:0.00 saturation:0.00 brightness:0.00 alpha:0.00]];
  [titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
	[titleLabel setTextColor:[UIColor whiteColor]];
	[titleLabel setText:NSLocalizedString(@"Moon Gate", nil)];
	[sectionView addSubview:titleLabel];
	return sectionView;
}

// -----------------------------------------------------------------------------
// row

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 28;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *CellIdentifier = @"MyIdentifer";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                   reuseIdentifier:CellIdentifier] autorelease];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell.textLabel setFont:[UIFont systemFontOfSize:14]];
    [cell.textLabel setNumberOfLines:1];
  }
  NSDictionary *gate = [gateTimeTable objectAtIndex:indexPath.row];
  
  [cell.textLabel setText:[gate objectForKey:@"gateName"]];
  
  if (indexPath.row == 0 && [MoonGate isGateOpen]) {
    NSDate *closeTime = [[gate objectForKey:@"openTime"] dateByAddingTimeInterval:(60*18)];
    int restTime = (int)[closeTime timeIntervalSinceNow];
    NSString *mmss = [NSString stringWithFormat:@"%02i:%02i", restTime / 60, restTime % 60];
    [cell.detailTextLabel setText:mmss];
    [cell.detailTextLabel setTextColor:[UIColor cyanColor]];
    [cell.textLabel setTextColor:[UIColor cyanColor]];
  }
  else {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"HH:mm"];
    [cell.detailTextLabel setText:[formatter stringFromDate:[gate objectForKey:@"openTime"]]];
    [cell.detailTextLabel setTextColor:[UIColor yellowColor]];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
  }
  
  return cell;
}

@end
