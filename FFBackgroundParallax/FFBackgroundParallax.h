//
//  FFBackgroundParallax.h
//  FFBackgroundParallax
//
//  Created by Felix Ayala on 5/28/15.
//  Copyright (c) 2015 Pandorga. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FFParallaxMode) {
	FFParallaxModeHorizontal = 0,
	FFParallaxModeVertical
};

@interface FFBackgroundParallax : UIView

@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic) enum FFParallaxMode scrollingMode;

- (void)setImageBackground:(UIImage *)image;

@end
