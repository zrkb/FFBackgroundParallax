FFBackgroundParallax
====================
[![License](https://img.shields.io/github/license/rockbarato/FFBackgroundParallax.svg)](http://opensource.org/licenses/MIT)
[![CocoaPods Platform](https://img.shields.io/cocoapods/p/FFBackgroundParallax.svg)](https://github.com/rockbarato/FFBackgroundParallax)
[![Language](https://img.shields.io/badge/language-Objective--C-green.svg)](https://github.com/rockbarato/FFBackgroundParallax)
[![CocoaPods Tag](https://img.shields.io/cocoapods/v/FFBackgroundParallax.svg)](https://github.com/rockbarato/FFBackgroundParallax)

Background Parallax Scrolling is a simple example for parallax scrolling based on several UIScrollViews. This library is simply a UIView subclass with two UIScrollView, one for content and the second for the background image.

![Preview](https://s3.amazonaws.com/f.cl.ly/items/2t3f2v1L0R1K3K0m012K/BackgroundParallax.gif)


## Installation

> Instead of adding the source files directly to your project, you may want to consider using [CocoaPods](http://cocoapods.org/) to manage your dependencies. Follow the instructions on the CocoaPods site to install the gem, and specify `FFBackgroundParallax` as a dependency in your `Podfile` with:

```ruby
pod 'FFBackgroundParallax', '~> 1.1.0'
```
But if you want to do it the old fashioned way, just add `FFBackgroundParallax.h/m` files to your project.

## Requirements

* ARC
* iOS 8.0 and above

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

if you need vertical compatibility you need to change `scrollingMode` property to `FFParallaxModeVertical` when initialize the class:


```objc
FFBackgroundParallax *backgroundParallax = [[FFBackgroundParallax alloc] initWithFrame:self.view.bounds];
backgroundParallax.scrollingMode = FFParallaxModeVertical;
```

## Todo

* ~~Vertical Compatibility~~
* Swift Demo

## Credits

* Minimal Design Badges - [https://dribbble.com/shots/1898692-Minimal-Design-Badges](https://dribbble.com/shots/1898692-Minimal-Design-Badges)
* Snowy Mountain Peaks Photo by Lee Roylland - [https://unsplash.com/@roylandnye](https://unsplash.com/@roylandnye)
* New York, United States by Todd Quackenbush - [https://unsplash.com/@toddquackenbush](https://unsplash.com/@toddquackenbush)

## Collaboration

Feel free to collaborate with ideas, issues and/or pull requests.

## License
FFBackgroundParallax is available under the [MIT](http://opensource.org/licenses/MIT) license. See the LICENSE file for more info.
