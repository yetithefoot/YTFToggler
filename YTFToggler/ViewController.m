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
    
    [[YTFToggler alloc] initWithView:self.view1 andPosition:TogglerPositionTop andText:@"Top"];
    [[YTFToggler alloc] initWithView:self.view2 andPosition:TogglerPositionLeft andText:@"Left"];
    [[YTFToggler alloc] initWithView:self.view3 andPosition:TogglerPositionRight andText:@"Right"];
    [[YTFToggler alloc] initWithView:self.view4 andPosition:TogglerPositionBottom andText:@"Bottom"];
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
@end
