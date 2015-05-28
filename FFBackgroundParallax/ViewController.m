//
//  ViewController.m
//  FFBackgroundParallax
//
//  Created by Felix Ayala on 5/28/15.
//  Copyright (c) 2015 Pandorga. All rights reserved.
//

#import "ViewController.h"
#import "FFBackgroundParallax.h"

@interface ViewController ()

@end

#define kImageSize 250.0
#define kTotalItems 6

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	
	FFBackgroundParallax *backgroundParallax = [[FFBackgroundParallax alloc] initWithFrame:self.view.bounds];
	[backgroundParallax setImageBackground:[UIImage imageNamed:@"mountains.jpg"]];
	
	for (NSUInteger i = 0; i < kTotalItems; i++) {
		CGFloat xOrigin = (i * CGRectGetWidth(backgroundParallax.frame)) + (CGRectGetWidth(backgroundParallax.bounds) / 2) - (kImageSize / 2);
		
		NSLog(@"i: %i - xOrigin: %f", i, xOrigin);
		
		UIImageView *badge = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, (CGRectGetHeight(backgroundParallax.frame) / 2) - (kImageSize / 2), kImageSize, kImageSize)];
		
		badge.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i", (i + 1)]];
		
		[backgroundParallax.contentScrollView addSubview:badge];
	}
	[backgroundParallax.contentScrollView setContentSize:CGSizeMake(CGRectGetWidth(backgroundParallax.frame) * kTotalItems, CGRectGetHeight(backgroundParallax.frame))];
	[self.view addSubview:backgroundParallax];
}

- (void)viewDidAppear:(BOOL)animated {
}

@end
