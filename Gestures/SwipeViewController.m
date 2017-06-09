//
//  SwipeViewController.m
//  Gestures
//
//  Created by Harry Li on 2017-06-08.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property (nonatomic) UIView *brownView;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = 350;
    CGFloat height = 50;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    UIView *brownView = [[UIView alloc] initWithFrame:frame];
    brownView.backgroundColor = [UIColor brownColor];
    self.brownView = brownView;
    [self.view addSubview:brownView];
    
    UIView *whiteView = [[UIView alloc] initWithFrame:brownView.bounds];
    whiteView.backgroundColor = [UIColor whiteColor];
    [brownView addSubview:whiteView];
    
    [brownView setClipsToBounds:YES];

    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwipped:)];
    UISwipeGestureRecognizer *swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwipped:)];
    
    
    [swipeLeftGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRightGesture setDirection:UISwipeGestureRecognizerDirectionRight];
    
    [whiteView addGestureRecognizer:swipeLeftGesture];
    [whiteView addGestureRecognizer:swipeRightGesture];
}

- (void)viewSwipped:(UISwipeGestureRecognizer *) sender{
    
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionLeft:{
            sender.view.center = CGPointMake(CGRectGetMidX(self.brownView.bounds) - 100, sender.view.center.y);
            break;
        }
        case UISwipeGestureRecognizerDirectionRight:{
            sender.view.center = CGPointMake(CGRectGetMidX(self.brownView.bounds), sender.view.center.y);
            break;
        }
        default:
            break;
    }
    
}

@end
