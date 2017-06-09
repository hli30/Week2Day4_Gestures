//
//  TapViewController.m
//  Gestures
//
//  Created by Harry Li on 2017-06-08.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat width = 100;
    CGFloat height = 100;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    
    [view addGestureRecognizer:tapGesture];
}

- (void)viewTapped:(UITapGestureRecognizer *) sender{
    
    UIColor *color = [sender.view.backgroundColor isEqual:[UIColor orangeColor]] ? [UIColor purpleColor] : [UIColor orangeColor];
    
    sender.view.backgroundColor = color;
}

@end
