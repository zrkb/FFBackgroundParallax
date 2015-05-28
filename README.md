FFBackgroundParallax
====================

Background Parallax is a simple example for parallax scrolling based on several UIScrollViews.

![Preview](https://s3.amazonaws.com/f.cl.ly/items/2t3f2v1L0R1K3K0m012K/BackgroundParallax.gif)

## Usage

First you need to import the header file

```objc
#import "FFBackgroundParallax.h"
```

Then define your Total Items and your Item Image Size`

```objc
#define kImageSize 250.0
#define kTotalItems 6
```

Add subviews normally to the public property `contentScrollView`

```objc
@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self configureBackgroundParallax];
}

- (void)configureBackgroundParallax {
	
	FFBackgroundParallax *backgroundParallax = [[FFBackgroundParallax alloc] initWithFrame:self.view.bounds];
	[backgroundParallax setImageBackground:[UIImage imageNamed:@"mountains.jpg"]];
	
	for (NSUInteger i = 0; i < kTotalItems; i++) {
		CGFloat xOrigin = (i * CGRectGetWidth(backgroundParallax.frame)) + (CGRectGetWidth(backgroundParallax.bounds) / 2) - (kImageSize / 2);
		
		UIImageView *badge = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, (CGRectGetHeight(backgroundParallax.frame) / 2) - (kImageSize / 2), kImageSize, kImageSize)];
		
		badge.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i", (i + 1)]];
		
		[backgroundParallax.contentScrollView addSubview:badge];
	}
	
	[backgroundParallax.contentScrollView setContentSize:CGSizeMake(CGRectGetWidth(backgroundParallax.frame) * kTotalItems, CGRectGetHeight(backgroundParallax.frame))];
	
	[self.view addSubview:backgroundParallax];
}

@end
```

To add your background image, simply call:

```objc
- (void)setImageBackground:(UIImage *)image
```

## Collaboration

Feel free to collaborate with ideas, issues and/or pull requests.

## License
FFBackgroundParallax is available under the [MIT](http://opensource.org/licenses/MIT) license. See the LICENSE file for more info.
