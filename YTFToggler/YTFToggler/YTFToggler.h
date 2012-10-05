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


@interface YTFToggler : UIViewController

@property (retain, nonatomic) UIView * contentView;
@property (retain, nonatomic) NSString * text;
@property (assign, nonatomic) int position;

- (id)initWithView:(UIView *) aView andPosition:(int)position andText:(NSString *)text;

@end
