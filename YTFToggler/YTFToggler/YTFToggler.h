//
//  YTFToggleView.h
//  YTFViewToggler
//
//  Created by yeti on 05.10.12.
//  Copyright (c) 2012 yeti. All rights reserved.
//

#import <UIKit/UIKit.h>

enum TogglerPosition {
    TogglerPositionLeft = 0,
    TogglerPositionRight,
    TogglerPositionTop,
    TogglerPositionBottom
};

enum TogglerState {
    TogglerHidden = 0,
    TogglerVisible
};

@class YTFToggler;

@protocol YTFTogglerDelegate <NSObject>

@optional

-(void) didOpenToggler:(YTFToggler *) toggler;
-(void) didCloseToggler:(YTFToggler *) toggler;

@end


@interface YTFToggler : UIViewController{
    CGRect _originalContentViewRect;
}


@property(retain, nonatomic) UIButton * gripButton;
@property (retain, nonatomic) UIView * contentView;
@property (retain, nonatomic) NSString * text;
@property (assign, nonatomic) int position;
@property (assign, nonatomic) id<YTFTogglerDelegate> delegate;
@property (readonly) CGRect originalRect;


-(void) open;
-(void) close;
-(void) toggle;

-(void) show;
-(void) hide;

- (id)initWithView:(UIView *) aView andPosition:(int)position andText:(NSString *)text;

@end
