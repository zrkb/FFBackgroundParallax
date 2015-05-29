FFBackgroundParallax
====================
[![Join the chat at https://gitter.im/rockbarato/FFBackgroundParallax](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/rockbarato/FFBackgroundParallax?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License](http://img.shields.io/badge/License-MIT-blue.svg)](http://opensource.org/licenses/MIT)
[![Plaform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://github.com/rockbarato/FFBackgroundParallax)
[![Version](https://img.shields.io/badge/Version-1.1.0-ff69b4.svg)](https://github.com/rockbarato/FFBackgroundParallax)
[![Build](https://img.shields.io/badge/Build-46-brightgreen.svg)](https://github.com/rockbarato/FFBackgroundParallax)

Background Parallax is a simple example for parallax scrolling based on several UIScrollViews. This library is simply a UIView subclass with two UIScrollView, one for content and the second for the background image.

![Preview](https://s3.amazonaws.com/f.cl.ly/items/2t3f2v1L0R1K3K0m012K/BackgroundParallax.gif)

## Usage

First you need to import the header file

```objc
#import "FFBackgroundParallax.h"
```

Then define your Total Items and your Item Image Size

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

## Todo

* Vertical Compatibility
* Swift Demo

## Credits

* Minimal Design Badges - [https://dribbble.com/shots/1898692-Minimal-Design-Badges](https://dribbble.com/shots/1898692-Minimal-Design-Badges)
* Snowy Mountain Peaks Photo by Lee Roylland - [https://unsplash.com/roylandnye](https://unsplash.com/roylandnye)

## Collaboration

Feel free to collaborate with ideas, issues and/or pull requests.

## License
FFBackgroundParallax is available under the [MIT](http://opensource.org/licenses/MIT) license. See the LICENSE file for more info.
