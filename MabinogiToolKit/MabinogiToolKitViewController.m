
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
  NSArray *pageSymbols = [[[NSArray alloc] initWithObjects:
                          @"DailyEffectsView", @"MoonGateView", @"PriceView", 
                          @"RuaView", @"CreditView", 
                          nil] autorelease];
  for (int i = 0; i < [pageSymbols count]; i++) {
    NSString *viewSymbol = [pageSymbols objectAtIndex:i];
    NSString *viewControllerClassSymbol = [NSString stringWithFormat:@"%@Controller", viewSymbol];
    id viewControllerClass = objc_getClass([viewControllerClassSymbol UTF8String]);
    UIViewController *viewController = [[[viewControllerClass alloc] initWithNibName:viewSymbol bundle:nil] autorelease];
    [viewController.view setFrame:[self rectForPage:i]];
    [scrollView addSubview:viewController.view];
  }
  
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
