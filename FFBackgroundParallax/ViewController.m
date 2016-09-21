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
	
	// [self configureHorizontalBackgroundParallax];
	[self configureVerticalBackgroundParallax];
}

- (void)configureHorizontalBackgroundParallax {
	
	// Instantiate the View
	FFBackgroundParallax *backgroundParallax = [[FFBackgroundParallax alloc] initWithFrame:self.view.bounds];
	
	// Here you can set your Image Background for Parallax Scrolling
	[backgroundParallax setImageBackground:[UIImage imageNamed:@"mountains.jpg"]];
	
	for (NSUInteger i = 0; i < kTotalItems; i++) {
		CGFloat xOrigin = (i * CGRectGetWidth(backgroundParallax.frame)) + (CGRectGetWidth(backgroundParallax.bounds) / 2) - (kImageSize / 2);
		
		UIImageView *badge = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, (CGRectGetHeight(backgroundParallax.frame) / 2) - (kImageSize / 2), kImageSize, kImageSize)];
		
		badge.image = [UIImage imageNamed:[NSString stringWithFormat:@"%lu", (i + 1)]];
		
		[backgroundParallax.contentScrollView addSubview:badge];
	}
	
	// Update `setContentSize` property of your `contentScrollView`
	[backgroundParallax.contentScrollView setContentSize:CGSizeMake(CGRectGetWidth(backgroundParallax.frame) * kTotalItems, CGRectGetHeight(backgroundParallax.frame))];
	
	[self.view addSubview:backgroundParallax];
}

- (void)configureVerticalBackgroundParallax {
	
	// Instantiate the View
	FFBackgroundParallax *backgroundParallax = [[FFBackgroundParallax alloc] initWithFrame:self.view.bounds];
	backgroundParallax.scrollingMode = FFParallaxModeVertical;
	
	// Here you can set your Image Background for Parallax Scrolling
	[backgroundParallax setImageBackground:[UIImage imageNamed:@"newyork.jpg"]];
	
	CGFloat xOrigin = (CGRectGetWidth(backgroundParallax.frame) / 2) - (kImageSize / 2);
	
	for (NSUInteger i = 0; i < kTotalItems; i++) {
		CGFloat yOrigin = (i * CGRectGetHeight(backgroundParallax.frame)) + (CGRectGetHeight(backgroundParallax.bounds) / 2) - (kImageSize / 2);
		
		UIImageView *badge = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, yOrigin, kImageSize, kImageSize)];
		
		badge.image = [UIImage imageNamed:[NSString stringWithFormat:@"%lu", (i + 1)]];
		
		[backgroundParallax.contentScrollView addSubview:badge];
	}
	
	// Update `setContentSize` property of your `contentScrollView`
	[backgroundParallax.contentScrollView setContentSize:CGSizeMake(CGRectGetWidth(backgroundParallax.frame), CGRectGetHeight(backgroundParallax.frame) * kTotalItems)];
	
	[self.view addSubview:backgroundParallax];
}

@end
