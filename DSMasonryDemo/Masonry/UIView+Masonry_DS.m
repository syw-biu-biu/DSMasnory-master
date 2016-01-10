//
//  UIView+Masonry_DS.m
//  zhefengle
//
//  Created by YMY on 15/8/13.
//  Copyright (c) 2015年 vanwell. All rights reserved.
//

#import "UIView+Masonry_DS.h"
#import "Masonry.h"

@implementation UIView (Masonry_DS)

-(void)distributeSpacingVerticallyWith:(NSArray*)views
{
    
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity:views.count+1];
    for (int i=0; i<views.count+1; ++i) {
        UIView *v = [UIView new];
        [spaces addObject:v];
        [self addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);
        }];
    }

    UIView *v0 = spaces[0];
    __weak __typeof(&*self)ws = self;
    [v0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top);
        make.left.equalTo(((UIView*)views[0]).left);
    }];
    
    UIView *lastSpace = v0;
    for (int i=0; i<views.count; ++i) {
        UIView *obj = views[i];
        UIView *space = spaces[i+1];
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastSpace.mas_bottom);
        }];
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(obj.mas_bottom);
            make.left.equalTo(obj.mas_left);
            make.height.equalTo(v0);
        }];
        lastSpace = space;
    }

    [lastSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.mas_bottom);
        //make.height.equalTo(@(bottomGap));
    }];
}

-(void)distributeSpacingVerticallyWith:(NSArray*)views topGap:(CGFloat)topGap bottomGap:(CGFloat)bottomGap
{
    
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity:views.count-1];
    for (int i=0; i<views.count-1; ++i) {
        UIView *v = [UIView new];
        [spaces addObject:v];
        [self addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);
        }];
    }
    
    __weak __typeof(&*self)ws = self;
    UIView *view1 = views[0];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(topGap);
    }];
    
    UIView *v0 = spaces[0];
    [v0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_bottom);
        make.left.equalTo(((UIView*)views[0]).left);
    }];
    
    UIView *lastSpace = v0;
    for (int i=0; i<views.count-2; ++i) {
        UIView *obj = views[i+1];
        UIView *space = spaces[i+1];
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastSpace.mas_bottom);
        }];
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(obj.mas_bottom);
            make.left.equalTo(obj.mas_left);
            make.height.equalTo(v0);
        }];
        lastSpace = space;
    }
    
    UIView *lastView = views[[views count]-1];
    [lastSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_top);
        //make.height.equalTo(@(bottomGap));
    }];
    
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.mas_bottom).offset(-bottomGap);
    }];
}

/*------------------------------------------------*/
-(void)distributeSpacingHorizontallyWith:(NSArray *)views{
    
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity:views.count+1];
    for (int i=0; i<views.count+1; ++i) {
        UIView *v = [UIView new];
        [spaces addObject:v];
        [self addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);
        }];
    }
    
    UIView *v0 = spaces[0];
    __weak __typeof(&*self)ws = self;
    [v0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.top.equalTo(((UIView*)views[0]).top);
    }];
    
    UIView *lastSpace = v0;
    for (int i=0; i<views.count; ++i) {
        UIView *obj = views[i];
        UIView *space = spaces[i+1];
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastSpace.mas_right);
        }];
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(obj.mas_right);
            make.top.equalTo(obj.mas_top);
            make.width.equalTo(v0);
        }];
        lastSpace = space;
    }
    
    [lastSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right);
        //make.height.equalTo(@(bottomGap));
    }];

}

-(void)distributeSpacingHorizontallyWith:(NSArray *)views leftGap:(CGFloat)leftGap rightGap:(CGFloat)rightGap{
    
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity:views.count-1];
    for (int i=0; i<views.count-1; ++i) {
        UIView *v = [UIView new];
        [spaces addObject:v];
        [self addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);
        }];
    }
    
    __weak __typeof(&*self)ws = self;
    UIView *view1 = views[0];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(leftGap);
    }];
    
    UIView *v0 = spaces[0];
    [v0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_right);
        make.top.equalTo(((UIView*)views[0]).top);
    }];
    
    UIView *lastSpace = v0;
    for (int i=0; i<views.count-2; ++i) {
        UIView *obj = views[i+1];
        UIView *space = spaces[i+1];
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastSpace.mas_right);
        }];
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(obj.mas_right);
            make.top.equalTo(obj.mas_top);
            make.height.equalTo(v0);
        }];
        lastSpace = space;
    }
    
    UIView *lastView = views[[views count]-1];
    [lastSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lastView.mas_left);
        //make.height.equalTo(@(bottomGap));
    }];
    
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right).offset(-rightGap);
    }];
}
@end
