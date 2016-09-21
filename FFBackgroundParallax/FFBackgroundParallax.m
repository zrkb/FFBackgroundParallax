//
//  FFBackgroundParallax.m
//  FFBackgroundParallax
//
//  Created by Felix Ayala on 5/28/15.
//  Copyright (c) 2015 Pandorga. All rights reserved.
//

#import "FFBackgroundParallax.h"

@interface FFBackgroundParallax () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *imageScrollView;

@end

@implementation FFBackgroundParallax

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (self) {
		[self baseInit];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self baseInit];
	}
	return self;
}

- (void)baseInit {
	
	_scrollingMode = FFParallaxModeHorizontal;
	
	self.imageScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
	self.imageScrollView.bounces = NO;
	self.imageScrollView.userInteractionEnabled = NO;
	self.imageScrollView.backgroundColor = [UIColor greenColor];
	
	[self addSubview:self.imageScrollView];
	
	self.contentScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
	self.contentScrollView.userInteractionEnabled = YES;
	self.contentScrollView.pagingEnabled = YES;
	self.contentScrollView.delegate = self;
	
	[self addSubview:self.contentScrollView];
}

- (void)setImageBackground:(UIImage *)image {
	
	UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:image];
	
	CGFloat bgHeight;
	CGFloat bgWidth;
	
	if (self.scrollingMode == FFParallaxModeHorizontal) {
		bgHeight = CGRectGetHeight(self.bounds);
		bgWidth = (image.size.width * bgHeight) / image.size.height;
	} else {
		bgWidth = CGRectGetWidth(self.bounds);
		bgHeight = (image.size.height * bgWidth) / image.size.width;
	}
	
	backgroundImageView.frame = CGRectMake(0, 0, bgWidth, bgHeight);
	
	self.imageScrollView.backgroundColor = [UIColor greenColor];
	[self.imageScrollView setContentSize:CGSizeMake(CGRectGetWidth(backgroundImageView.frame), CGRectGetHeight(backgroundImageView.frame))];
	[self.imageScrollView addSubview:backgroundImageView];
}


- (CGFloat)maximumOffsetForScrollView:(UIScrollView *)scrollView {
	
	if (self.scrollingMode == FFParallaxModeHorizontal) {
		CGFloat contentWidth = scrollView.contentSize.width;
		CGFloat frameWidth = CGRectGetWidth(scrollView.frame);
		
		return contentWidth - frameWidth;
	} else {
		CGFloat contentHeight = scrollView.contentSize.height;
		CGFloat frameHeight = CGRectGetWidth(scrollView.frame);
		
		return contentHeight - frameHeight;
	}
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	
	CGFloat currentOffset;
	
	if (self.scrollingMode == FFParallaxModeHorizontal) {
		currentOffset = self.contentScrollView.contentOffset.x;
	} else {
		currentOffset = self.contentScrollView.contentOffset.y;
	}
	
	CGFloat viewPortion;
	
	if (self.scrollingMode == FFParallaxModeHorizontal) {
		viewPortion = (self.contentScrollView.contentSize.width - CGRectGetWidth(self.bounds));
	} else {
		viewPortion = (self.contentScrollView.contentSize.height - CGRectGetHeight(self.bounds));
	}
	
	
	if (currentOffset >= 0 && currentOffset <= viewPortion) {
		CGFloat maximumContentOffset = [self maximumOffsetForScrollView:self.contentScrollView];
		
		CGFloat percentageOffset = currentOffset / maximumContentOffset;
		
		CGFloat maximumImageOffset = [self maximumOffsetForScrollView:self.imageScrollView];
		CGFloat actualImageOffset = maximumImageOffset * percentageOffset;
		
		CGPoint newPoint;
		
		if (self.scrollingMode == FFParallaxModeHorizontal) {
			newPoint = CGPointMake(actualImageOffset, 0);
		} else {
			newPoint = CGPointMake(0, actualImageOffset);
		}
		
		[self.imageScrollView setContentOffset:newPoint];
	}
}


@end





