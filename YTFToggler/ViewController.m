//
//  ViewController.m
//  YTFViewToggler
//
//  Created by yeti on 05.10.12.
//  Copyright (c) 2012 yeti. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.view1.layer.borderWidth = 1.0;
    self.view2.layer.borderWidth = 1.0;
    self.view3.layer.borderWidth = 1.0;
    self.view4.layer.borderWidth = 1.0;
    
    self.view1.layer.borderColor = [UIColor yellowColor].CGColor;
    self.view2.layer.borderColor = [UIColor redColor].CGColor;
    self.view3.layer.borderColor = [UIColor whiteColor].CGColor;
    self.view4.layer.borderColor = [UIColor blackColor].CGColor;
    
    _toggler1 = [[YTFToggler alloc] initWithView:self.view1 andPosition:TogglerPositionTop andText:@"Top"];
    _toggler2 = [[YTFToggler alloc] initWithView:self.view2 andPosition:TogglerPositionLeft andText:@"Left"];
    _toggler3 = [[YTFToggler alloc] initWithView:self.view3 andPosition:TogglerPositionRight andText:@"Right"];
    _toggler4 = [[YTFToggler alloc] initWithView:self.view4 andPosition:TogglerPositionBottom andText:@"Bottom"];
}



- (void)dealloc {
    [_view1 release];
    [_view2 release];
    [_view3 release];
    [_view4 release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setView1:nil];
    [self setView2:nil];
    [self setView3:nil];
    [self setView4:nil];
    [super viewDidUnload];
}

- (IBAction)segmentedControlValueChanged:(UISegmentedControl *)sender forEvent:(UIEvent *)event {
    

    switch (sender.tag) {
        case 1:
            (sender.selectedSegmentIndex ==0)?[_toggler1 show]:[_toggler1 hide];
            break;
        case 2:
            (sender.selectedSegmentIndex ==0)?[_toggler2 show]:[_toggler2 hide];
            break;
        case 3:
            (sender.selectedSegmentIndex ==0)?[_toggler3 show]:[_toggler3 hide];
            break;
        case 4:
            (sender.selectedSegmentIndex ==0)?[_toggler4 show]:[_toggler4 hide];
            break;
    }
    
}

@end
