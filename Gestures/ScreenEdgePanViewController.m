//
//  ScreenEdgePanViewController.m
//  Gestures
//
//  Created by Harry Li on 2017-06-08.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "ScreenEdgePanViewController.h"

@interface ScreenEdgePanViewController ()

@property (nonatomic) UIView *blueView;
@property (nonatomic) CGFloat oldBlueViewCenterX;
@property (nonatomic) CGFloat newBlueViewCenterX;
@property (nonatomic) UIScreenEdgePanGestureRecognizer *screenRightEdgePan;

@end

@implementation ScreenEdgePanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat width = 400;
    CGFloat height = 400;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) + width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);

    UIView *blueView = [[UIView alloc] initWithFrame:frame];
    blueView.backgroundColor = [UIColor blueColor];
    self.blueView = blueView;
    self.oldBlueViewCenterX = blueView.center.x;
    [self.view addSubview:blueView];
    
    UIScreenEdgePanGestureRecognizer *screenRightEdgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(rightEdgePanned:)];
    
    [screenRightEdgePan setEdges:UIRectEdgeRight];
    
    self.screenRightEdgePan = screenRightEdgePan;
    
    [blueView addGestureRecognizer:screenRightEdgePan];
}

- (void)rightEdgePanned: (UIScreenEdgePanGestureRecognizer *) sender{

    CGPoint translation = [sender translationInView:sender.view];
    sender.view.center = CGPointMake(sender.view.center.x + translation.x, sender.view.center.y);
    [sender setTranslation:CGPointZero inView:sender.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        if (sender.view.center.x > self.oldBlueViewCenterX - 100){
            [UIView animateWithDuration:.3 animations:^{
                sender.view.center = CGPointMake(self.oldBlueViewCenterX, sender.view.center.y);
            }];
        } else{
            [UIView animateWithDuration:.3 animations:^{
                sender.view.center = CGPointMake(self.view.center.x + 50, sender.view.center.y);
            }];
            self.newBlueViewCenterX = sender.view.center.x;
            [sender.view removeGestureRecognizer:sender];
            
            UIPanGestureRecognizer *screenPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewPanned:)];
        
            [self.blueView addGestureRecognizer:screenPan];
        }
    }
}

- (void)viewPanned:(UIPanGestureRecognizer *) sender{
    
    CGPoint translation = [sender translationInView:sender.view];
    sender.view.center = CGPointMake(sender.view.center.x + translation.x, sender.view.center.y);
    [sender setTranslation:CGPointZero inView:sender.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        if (sender.view.center.x < self.newBlueViewCenterX + 100){
            [UIView animateWithDuration:.3 animations:^{
                sender.view.center = CGPointMake(self.newBlueViewCenterX, sender.view.center.y);
            }];
        } else{
            [UIView animateWithDuration:.3 animations:^{
                sender.view.center = CGPointMake(self.oldBlueViewCenterX, sender.view.center.y);
            }];
            [sender.view removeGestureRecognizer:sender];
            
            [self.blueView addGestureRecognizer:self.screenRightEdgePan];
        }
    }
}

@end
