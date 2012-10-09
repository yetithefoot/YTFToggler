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

@end


@implementation YTFToggler

- (id)initWithView:(UIView *) aView andPosition:(int)position andText:(NSString *)text
{
    self = [super init];
    if (self) {
        // Initialization code
        
        self.contentView = aView;
        _originalContentViewRect = aView.frame;
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
        rect.origin.x = self.contentView.frame.origin.x - BTN_LONG/2 - BTN_SHORT/2 +1;
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
        rect.origin.x = self.contentView.frame.size.width - BTN_LONG/2 + BTN_SHORT/2 -1;
        rect.size.width = BTN_LONG;
        rect.origin.y = self.contentView.frame.origin.y + self.contentView.frame.size.height/2 - BTN_SHORT/2;
        rect.size.height = BTN_SHORT;
        
        // create button
        self.gripButton = [[UIButton alloc]initWithFrame:rect];
        // and rotate it - frame below prepared for rotation
        self.gripButton.transform = CGAffineTransformMakeRotation(- M_PI / 2);
        
    }else if(self.position == TogglerPositionBottom){
        
        // make frame prepared for rotation
        CGRect rect = self.contentView.frame;
        rect.origin.x = self.contentView.frame.origin.x + (self.contentView.frame.size.width - BTN_LONG)/2;
        rect.size.width = BTN_LONG;
        rect.origin.y = self.contentView.frame.origin.y + self.contentView.frame.size.height-1;
        rect.size.height = BTN_SHORT;
        
        // create button
        self.gripButton = [[UIButton alloc]initWithFrame:rect];

    }else if(self.position == TogglerPositionTop){
        
        // make frame prepared for rotation
        CGRect rect = self.contentView.frame;
        rect.origin.x = self.contentView.frame.origin.x + (self.contentView.frame.size.width - BTN_LONG)/2;
        rect.size.width = BTN_LONG;
        rect.origin.y = self.contentView.frame.origin.y - BTN_SHORT +1;
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
    [self.gripButton addTarget:self action:@selector(toggle) forControlEvents:UIControlEventTouchUpInside];
    
    // add to superview of view, to avoid button hiding when main view is hided + handle user interactions outside of bounds
    [self.contentView.superview insertSubview:self.gripButton belowSubview:self.contentView];


}


-(CGRect)originalRect{
    return _originalContentViewRect;
}

-(void)open{
    
    // relocate contentview  frame
    CGRect frame = self.contentView.frame;
    switch (self.position) {
        case TogglerPositionLeft: frame.size.width += _originalContentViewRect.size.width; break;
        case TogglerPositionRight: frame.size.width += _originalContentViewRect.size.width; break;
        case TogglerPositionBottom: frame.size.height += _originalContentViewRect.size.height; break;
        case TogglerPositionTop: frame.size.height += _originalContentViewRect.size.height; break;
    }
    self.contentView.frame = frame;
    
    
    
    // relocate toggler frame
    frame = self.gripButton.frame;
    switch (self.position) {
        case TogglerPositionLeft: frame.origin.x -= _originalContentViewRect.size.width; break;
        case TogglerPositionRight: frame.origin.x += _originalContentViewRect.size.width; break;
        case TogglerPositionBottom: frame.origin.y += _originalContentViewRect.size.height; break;
        case TogglerPositionTop: frame.origin.y -= _originalContentViewRect.size.height; break;
    }
    self.gripButton.frame = frame;
    
    
    // fire event
    if([self.delegate respondsToSelector:@selector(didOpenToggler:)]){
        [self.delegate performSelector:@selector(didOpenToggler:) withObject:self];
    }
}

-(void)close{

    
    // relocate contentview  frame
    CGRect frame = self.contentView.frame;
    switch (self.position) {
        case TogglerPositionLeft: frame.size.width = 0; break;
        case TogglerPositionRight: frame.size.width = 0; break;
        case TogglerPositionBottom: frame.size.height = 0; break;
        case TogglerPositionTop: frame.size.height = 0; break;
    }
    self.contentView.frame = frame;
    
    // relocate toggler frame
    frame = self.gripButton.frame;
    switch (self.position) {
        case TogglerPositionLeft: frame.origin.x += _originalContentViewRect.size.width; break;
        case TogglerPositionRight: frame.origin.x -= _originalContentViewRect.size.width; break;
        case TogglerPositionBottom: frame.origin.y -= _originalContentViewRect.size.height; break;
        case TogglerPositionTop: frame.origin.y += _originalContentViewRect.size.height; break;
    }
    self.gripButton.frame = frame;
    
    // fire event
    if([self.delegate respondsToSelector:@selector(didCloseToggler:)]){
        [self.delegate performSelector:@selector(didCloseToggler:) withObject:self];
    }
}

-(void) toggle{
    if(self.contentView.frame.size.width == 0 || self.contentView.frame.size.height == 0){
        [self open];
    }else{
        [self close];
    }
}


-(void) show{
    self.contentView.hidden = NO;
    self.gripButton.hidden = NO;
}

-(void) hide{
    self.contentView.hidden = YES;
    self.gripButton.hidden = YES;
}


- (void)dealloc
{
    [self.gripButton release];
    [super dealloc];
}


@end
