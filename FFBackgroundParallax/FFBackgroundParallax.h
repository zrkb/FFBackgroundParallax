//
//  FFBackgroundParallax.h
//  FFBackgroundParallax
//
//  Created by Felix Ayala on 5/28/15.
//  Copyright (c) 2015 Pandorga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFBackgroundParallax : UIView

@property (nonatomic, strong) UIScrollView *contentScrollView;

- (void)setImageBackground:(UIImage *)image;

@end
