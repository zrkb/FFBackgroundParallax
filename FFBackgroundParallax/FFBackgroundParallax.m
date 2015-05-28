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

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		
		[self baseInit];
		
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		
		[self baseInit];
		
	}
	return self;
}

- (void)baseInit {
	
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
	
	CGFloat bgHeight = CGRectGetHeight(self.bounds);
	CGFloat bgWidth = (image.size.width * bgHeight) / image.size.height;
	
	backgroundImageView.frame = CGRectMake(0, 0, bgWidth, bgHeight);
	
	self.imageScrollView.backgroundColor = [UIColor greenColor];
	[self.imageScrollView setContentSize:CGSizeMake(CGRectGetWidth(backgroundImageView.frame), CGRectGetHeight(backgroundImageView.frame))];
	[self.imageScrollView addSubview:backgroundImageView];
}


- (CGFloat)maximumOffsetForScrollView:(UIScrollView *)scrollView
{
	CGFloat contentWidth = scrollView.contentSize.width;
	CGFloat frameWidth = CGRectGetWidth(scrollView.frame);
	
	return contentWidth - frameWidth;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	
	CGFloat currentOffset = self.contentScrollView.contentOffset.x;
	
	if (currentOffset >= 0 && currentOffset <= (self.contentScrollView.contentSize.width - CGRectGetWidth(self.bounds))) {
		CGFloat maximumContentOffset = [self maximumOffsetForScrollView:self.contentScrollView];
		
		CGFloat percentageOffset = currentOffset/maximumContentOffset;
		
		CGFloat maximumImageOffset = [self maximumOffsetForScrollView:self.imageScrollView];
		CGFloat actualImageOffset = maximumImageOffset * percentageOffset;
		
		[self.imageScrollView setContentOffset:CGPointMake(actualImageOffset, 0)];
	}
}


@end





