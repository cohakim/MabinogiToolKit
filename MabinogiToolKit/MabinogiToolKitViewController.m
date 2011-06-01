
#import "MabinogiToolKitViewController.h"

@interface MabinogiToolKitViewController ()
- (CGRect)rectForPage:(NSInteger)pageNumber;
- (CGFloat)baseWidth;
- (CGFloat)baseHeight;
- (NSInteger)pageSize;
@end

@implementation MabinogiToolKitViewController

@synthesize staticView;
@synthesize scrollView;
@synthesize pageControl;

#pragma mark -
#pragma mark Private Methods

- (CGRect)rectForPage:(NSInteger)pageNumber {
  return CGRectMake(self.baseWidth * pageNumber, 0, self.baseWidth, self.baseHeight);
}

- (CGFloat)baseWidth {
  return scrollView.frame.size.width;
}

- (CGFloat)baseHeight {
  return scrollView.frame.size.height;
}

- (NSInteger)pageSize {
  return pageControl.numberOfPages;
}

#pragma mark -
#pragma mark Inherit Methods

- (void)loadView {  
  [super loadView];
}  

- (void)viewDidLoad {
  [super viewDidLoad];
  // initialize background view
  UIImage *backgroundImage = [UIImage imageNamed:@"bgimg.jpg"];
  self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
  
  // initialize static view
  ErinnTimeViewController *erinnTimeViewController = 
    [[[ErinnTimeViewController alloc] initWithNibName:@"ErinnTimeView" bundle:nil] autorelease];
  [staticView addSubview:erinnTimeViewController.view];
  
  // initialize scroll view
  DailyEffectsViewController *weekEffectViewController = 
    [[[DailyEffectsViewController alloc] initWithNibName:@"WeekEffectView" bundle:nil] autorelease];
  MoonGateViewController *moonGateViewController = 
    [[[MoonGateViewController alloc] initWithNibName:@"MoonGateView" bundle:nil] autorelease];
  PriceViewController *priceViewController = 
    [[[PriceViewController alloc] initWithNibName:@"PriceView" bundle:nil] autorelease];
  RuaViewController *ruaViewController = 
    [[[RuaViewController alloc] initWithNibName:@"RuaView" bundle:nil] autorelease];
  CreditViewController *creditViewController = 
    [[[CreditViewController alloc] initWithNibName:@"CreditView" bundle:nil] autorelease];
  
  [weekEffectViewController.view setFrame:[self rectForPage:0]];
  [scrollView addSubview:weekEffectViewController.view];
  [moonGateViewController.view setFrame:[self rectForPage:1]];
  [scrollView addSubview:moonGateViewController.view];
  [priceViewController.view setFrame:[self rectForPage:2]];
  [scrollView addSubview:priceViewController.view];
  [ruaViewController.view setFrame:[self rectForPage:3]];
  [scrollView addSubview:ruaViewController.view];
  [creditViewController.view setFrame:[self rectForPage:4]];
  [scrollView addSubview:creditViewController.view];
  
  scrollView.contentSize = CGSizeMake(self.baseWidth * self.pageSize, self.baseHeight);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
  [super viewDidUnload];
}

- (void)dealloc {
  [super dealloc];
}

#pragma mark -
#pragma mark UIScrollView Methods

- (void)scrollViewDidScroll:(UIScrollView *)sender {  
  CGFloat pageWidth = scrollView.frame.size.width;  
  pageControl.currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;  
}  

- (IBAction)changePage:(id)sender {
  CGRect frame = scrollView.frame;  
  frame.origin.x = frame.size.width * pageControl.currentPage;  
  frame.origin.y = 0;  
  
  [scrollView scrollRectToVisible:frame animated:YES]; 
}

@end
