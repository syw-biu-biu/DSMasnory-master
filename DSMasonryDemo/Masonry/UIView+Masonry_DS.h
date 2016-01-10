//
//  UIView+Masonry_DS.h
//  zhefengle
//
//  Created by YMY on 15/8/13.
//  Copyright (c) 2015年 vanwell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Masonry_DS)

//竖直方向等间隙排放
-(void)distributeSpacingVerticallyWith:(NSArray*)views;
-(void)distributeSpacingVerticallyWith:(NSArray*)views topGap:(CGFloat)topGap bottomGap:(CGFloat)bottomGap;

//横向等间隙排放
- (void) distributeSpacingHorizontallyWith:(NSArray*)views;
-(void)distributeSpacingHorizontallyWith:(NSArray*)views leftGap:(CGFloat)leftGap rightGap:(CGFloat)rightGap;

@end
