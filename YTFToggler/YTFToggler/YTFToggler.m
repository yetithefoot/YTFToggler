//
//  YTFToggleView.m
//  YTFViewToggler
//
//  Created by yeti on 05.10.12.
//  Copyright (c) 2012 yeti. All rights reserved.
//

#import "YTFToggler.h"

#import <QuartzCore/QuartzCore.h>

@interface YTFToggler ()
    @property(retain, nonatomic) UIButton * gripButton;
@end


@implementation YTFToggler

- (id)initWithView:(UIView *) aView andPosition:(int)position andText:(NSString *)text
{
    self = [super init];
    if (self) {
        // Initialization code
        
        self.contentView = aView;
        self.position = position;
        self.text = text;
        
        
        [self customInit];
    }
    return self;
}

#define BTN_SHORT 20
#define BTN_LONG 80

- (void)customInit
{
    // we need to create 4 different modes to this toggler
    
    if(self.position == TogglerPositionLeft){
    
        // make frame prepared for rotation
        CGRect rect = self.contentView.frame;
        rect.origin.x = self.contentView.frame.origin.x - BTN_LONG/2 - BTN_SHORT/2;
        rect.size.width = BTN_LONG;
        rect.origin.y = self.contentView.frame.origin.y + self.contentView.frame.size.height/2 - BTN_SHORT/2;
        rect.size.height = BTN_SHORT;
        
        // create button
        self.gripButton = [[UIButton alloc]initWithFrame:rect];
        // and rotate it - frame below prepared for rotation
        self.gripButton.transform = CGAffineTransformMakeRotation(- M_PI / 2);
        
    }else if(self.position == TogglerPositionRight){
        
        // make frame prepared for rotation
        CGRect rect = self.contentView.frame;
        rect.origin.x = self.contentView.frame.size.width - BTN_LONG/2 + BTN_SHORT/2;
        rect.size.width = BTN_LONG;
        rect.origin.y = self.contentView.frame.origin.y + self.contentView.frame.size.height/2 - BTN_SHORT/2;
        rect.size.height = BTN_SHORT;
        
        // create button
        self.gripButton = [[UIButton alloc]initWithFrame:rect];
        // and rotate it - frame below prepared for rotation
        self.gripButton.transform = CGAffineTransformMakeRotation(- M_PI / 2);
        
    }else if(self.position == TogglerPositionTop){
        
        // make frame prepared for rotation
        CGRect rect = self.contentView.frame;
        rect.origin.x = self.contentView.frame.origin.x + (self.contentView.frame.size.width - BTN_LONG)/2;
        rect.size.width = BTN_LONG;
        rect.origin.y = self.contentView.frame.origin.y + self.contentView.frame.size.height;
        rect.size.height = BTN_SHORT;
        
        // create button
        self.gripButton = [[UIButton alloc]initWithFrame:rect];

    }else if(self.position == TogglerPositionBottom){
        
        // make frame prepared for rotation
        CGRect rect = self.contentView.frame;
        rect.origin.x = self.contentView.frame.origin.x + (self.contentView.frame.size.width - BTN_LONG)/2;
        rect.size.width = BTN_LONG;
        rect.origin.y = self.contentView.frame.origin.y - BTN_SHORT;
        rect.size.height = BTN_SHORT;
        
        // create button
        self.gripButton = [[UIButton alloc]initWithFrame:rect];
        
    }



    // tune colors and visuals
    self.gripButton.backgroundColor = self.contentView.backgroundColor;
    [self.gripButton setTitle:self.text forState:UIControlStateNormal];
    [self.gripButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.gripButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.gripButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [self.gripButton setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [self.gripButton.layer setCornerRadius:1.0f];
    [self.gripButton.layer setBorderColor:self.contentView.layer.borderColor];
    [self.gripButton.layer setBorderWidth:self.contentView.layer.borderWidth];
    
    // add handler to handle pat geatures
    [self.gripButton addTarget:self action:@selector(toggleView) forControlEvents:UIControlEventTouchUpInside];
    
    // add to superview of view, to avoid button hiding when main view is hided + handle user interactions outside of bounds
    [self.contentView.superview insertSubview:self.gripButton belowSubview:self.contentView];

}

-(void) toggleView{
    if(self.contentView.hidden){
        self.contentView.hidden = NO;
        
        // relocate toggler frame
        CGRect frame = self.gripButton.frame;
        
        switch (self.position) {
            case TogglerPositionLeft: frame.origin.x -= self.contentView.frame.size.width; break;
            case TogglerPositionRight: frame.origin.x += self.contentView.frame.size.width; break;
            case TogglerPositionTop: frame.origin.y += self.contentView.frame.size.height; break;
            case TogglerPositionBottom: frame.origin.y -= self.contentView.frame.size.height; break;
        }
        
        self.gripButton.frame = frame;

        
    }else{
        self.contentView.hidden = YES;
        
        
        // relocate toggler frame
        CGRect frame = self.gripButton.frame;
        
        switch (self.position) {
            case TogglerPositionLeft: frame.origin.x += self.contentView.frame.size.width; break;
            case TogglerPositionRight: frame.origin.x -= self.contentView.frame.size.width; break;
            case TogglerPositionTop: frame.origin.y -= self.contentView.frame.size.height; break;
            case TogglerPositionBottom: frame.origin.y += self.contentView.frame.size.height; break;
        }
        
        self.gripButton.frame = frame;
        
    }
}

- (void)dealloc
{
    [self.gripButton release];
    [super dealloc];
}


@end
