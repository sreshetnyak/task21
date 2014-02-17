//
//  TTViewController.m
//  UIViewAnimation
//
//  Created by sergey on 2/14/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#define SIZE 50
#define ENDPOINT 270

#import "TTViewController.h"

@interface TTViewController ()

@property (strong,nonatomic) UIView *firstView;
@property (strong,nonatomic) UIView *secondView;
@property (strong,nonatomic) UIView *thirdView;
@property (strong,nonatomic) UIView *fourView;

@property (strong,nonatomic) UIView *rightTop;
@property (strong,nonatomic) UIView *rightBottom;
@property (strong,nonatomic) UIView *leftTop;
@property (strong,nonatomic) UIView *leftBottom;

@property (strong,nonatomic) UIImageView *imageView;

@property (strong,nonatomic) NSArray *arrayPoint;
@property (strong,nonatomic) NSArray *arrayColor;
@property (strong,nonatomic) NSArray *imageArray;

@end

@implementation TTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.firstView = [[UIView alloc] initWithFrame:CGRectMake(50,150,SIZE,SIZE)];
    self.secondView = [[UIView alloc] initWithFrame:CGRectMake(50,200,SIZE,SIZE)];
    self.thirdView = [[UIView alloc] initWithFrame:CGRectMake(50,250,SIZE,SIZE)];
    self.fourView = [[UIView alloc] initWithFrame:CGRectMake(50,300,SIZE,SIZE)];
    
    self.rightTop = [[UIView alloc] initWithFrame:CGRectMake(0,0,SIZE,SIZE)];
    self.leftTop = [[UIView alloc] initWithFrame:CGRectMake(270,0,SIZE,SIZE)];
    self.leftBottom = [[UIView alloc] initWithFrame:CGRectMake(270,518,SIZE,SIZE)];
    self.rightBottom = [[UIView alloc] initWithFrame:CGRectMake(0,518,SIZE,SIZE)];
    
    self.firstView.backgroundColor = [self randomRGBColor];
    self.secondView.backgroundColor = [self randomRGBColor];
    self.thirdView.backgroundColor = [self randomRGBColor];
    self.fourView.backgroundColor = [self randomRGBColor];
    
    self.rightTop.tag = 2;
    

    
    self.arrayPoint = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(270, 0)],
                       [NSValue valueWithCGPoint:CGPointMake(270, 518)],
                       [NSValue valueWithCGPoint:CGPointMake(0, 518)],
                       [NSValue valueWithCGPoint:CGPointMake(0, 0)], nil];
    
    self.arrayColor = [NSArray arrayWithObjects:[UIColor redColor],[UIColor yellowColor],[UIColor greenColor],[UIColor blueColor], nil];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SIZE, SIZE)];
    
    self.imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"1.png"],
                                                [UIImage imageNamed:@"2.png"],
                                                [UIImage imageNamed:@"3.png"],
                                                [UIImage imageNamed:@"4.png"],
                                                [UIImage imageNamed:@"5.png"],
                                                [UIImage imageNamed:@"6.png"],
                                                [UIImage imageNamed:@"7.png"],
                                                [UIImage imageNamed:@"8.png"],
                                                [UIImage imageNamed:@"9.png"],
                                                [UIImage imageNamed:@"10.png"], nil];
    
    self.imageView.animationImages = self.imageArray;
    
    self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    
    [self.rightTop addSubview:self.imageView];
    
    [self.imageView startAnimating];
    
    
    [self.view addSubview:self.firstView];
    [self.view addSubview:self.secondView];
    [self.view addSubview:self.thirdView];
    [self.view addSubview:self.fourView];
    
    [self.view addSubview:self.rightTop];
    [self.view addSubview:self.rightBottom];
    [self.view addSubview:self.leftTop];
    [self.view addSubview:self.leftBottom];
    
    [self startAnimationView:self.firstView withAnimation:UIViewAnimationOptionCurveEaseIn];
    [self startAnimationView:self.secondView withAnimation:UIViewAnimationOptionCurveEaseInOut];
    [self startAnimationView:self.thirdView withAnimation:UIViewAnimationOptionCurveEaseOut];
    [self startAnimationView:self.fourView withAnimation:UIViewAnimationOptionCurveLinear];
    
    [self startAnimationView:self.rightTop withPoint:self.arrayPoint startSteps:0 colorArray:self.arrayColor];
    [self startAnimationView:self.leftTop withPoint:self.arrayPoint startSteps:1 colorArray:self.arrayColor];
    [self startAnimationView:self.leftBottom withPoint:self.arrayPoint startSteps:2 colorArray:self.arrayColor];
    [self startAnimationView:self.rightBottom withPoint:self.arrayPoint startSteps:3 colorArray:self.arrayColor];
    
    
    
    
}

- (void)startAnimationView:(UIView *)view withAnimation:(UIViewAnimationOptions)anim {
    
    [UIView animateWithDuration:3
                          delay:0
                        options:anim | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         view.frame = CGRectMake(ENDPOINT - SIZE, view.frame.origin.y, SIZE, SIZE);
                         view.backgroundColor = [self randomRGBColor];
                         
                     } completion:^(BOOL finished) {
                         NSLog(@"complate :)");
                     }];
}


- (void)startAnimationView:(UIView *)view withPoint:(NSArray *)pointArray startSteps:(int)step colorArray:(NSArray *)color {
    
    __block int steps = step;
    
    [UIView animateWithDuration:2
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         view.frame = CGRectMake([[pointArray objectAtIndex:steps]CGPointValue].x, [[self.arrayPoint objectAtIndex:steps]CGPointValue].y, SIZE, SIZE);
                         view.backgroundColor = [color objectAtIndex:steps];
                         
                         
                     } completion:^(BOOL finished) {
                         
                         if (steps == 3) {
                             steps = 0;
                         } else {
                             steps ++;
                         }
                         if (view.tag == 2) {
                             switch (steps) {
                                 case 0:
                                     view.transform = CGAffineTransformMakeRotation(2*M_PI);
                                     break;
                                 case 1:
                                     view.transform = CGAffineTransformMakeRotation(M_PI_2);
                                     break;
                                 case 2:
                                     view.transform = CGAffineTransformMakeRotation(-M_PI);
                                     break;
                                 case 3:
                                     view.transform = CGAffineTransformMakeRotation(-M_PI_2);
                                     break;
                             }
                         }
                         
                         [self startAnimationView:view withPoint:pointArray startSteps:steps colorArray:color];
                         
                         NSLog(@"complate :)");
                     }];
}


- (UIColor *)randomRGBColor {
    
    CGFloat r = (CGFloat)(arc4random() % 256) / 255;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
