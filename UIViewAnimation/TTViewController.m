//
//  TTViewController.m
//  UIViewAnimation
//
//  Created by sergey on 2/14/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTViewController.h"

@interface TTViewController ()

@property (weak,noatomic) UIView *firstView;
@property (weak,noatomic) UIView *secondView;
@property (weak,noatomic) UIView *thirdView;
@property (weak,noatomic) UIView *fourView;

@end

@implementation TTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.firstView = [[UIView alloc] initWithFrame:CGRectMake(0,0,50,50)];
    self.secondView = [[UIView alloc] initWithFrame:CGRectMake(50,0,50,50)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
