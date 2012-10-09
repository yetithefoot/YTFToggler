//
//  ViewController.h
//  YTFViewToggler
//
//  Created by yeti on 05.10.12.
//  Copyright (c) 2012 yeti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTFToggler.h"

@interface ViewController : UIViewController<YTFTogglerDelegate>{
    YTFToggler * _toggler1;
    YTFToggler * _toggler2;
    YTFToggler * _toggler3;
    YTFToggler * _toggler4;
}

@property (retain, nonatomic) IBOutlet UIView *view1;
@property (retain, nonatomic) IBOutlet UIView *view2;
@property (retain, nonatomic) IBOutlet UIView *view3;
@property (retain, nonatomic) IBOutlet UIView *view4;

- (IBAction)segmentedControlValueChanged:(UISegmentedControl *)sender forEvent:(UIEvent *)event;


@end
