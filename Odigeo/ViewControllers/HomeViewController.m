//
//  ViewController.m
//  Odigeo
//
//  Created by Fernando Canon on 30/11/14.
//  Copyright (c) 2014 Fernando Canon. All rights reserved.
//

#import "HomeViewController.h"
#import "TicketsTableViewController.h"
#import "UIImage+ImageEffects.h"
#import "FCPCoreDataStore.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalConstrain;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *horizontalConstrain;
@property (weak, nonatomic) IBOutlet UIImageView *plane;

@property (assign) float lastAngle;
@end

@implementation HomeViewController


- (void)viewDidLoad {
    self.title =NSStringFromClass([self class]);
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_backImageView setImage:[self blurWithImageEffects:[UIImage imageNamed:@"backImage.png"]]];
    
    
    [self animatePlane];
}

- (void)animatePlane {
    
    int tmp = _horizontalConstrain.constant;
    
    float angle =0.0f;
    
    float new= arc4random_uniform(self.view.frame.size.width);
    
    if(tmp <= new){
        
        if  (_lastAngle == 0)
            angle=0;
   
    
    }else{
        
        angle = M_PI ;
    }
    _lastAngle = angle;
    
    [UIView animateWithDuration:1.0f animations:^{
        _plane.transform = CGAffineTransformRotate( _plane.transform,angle);
    } completion:^(BOOL finished) {
        
        _horizontalConstrain.constant=new;
        
        [UIView animateWithDuration:5.5 animations:^{
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            
            [self animatePlane];
            
        }];
        
    }];
}


- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI *0.5f/* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = NO;
    rotationAnimation.repeatCount = NO;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)blurWithImageEffects:(UIImage *)image
{
    return [image applyBlurWithRadius:10 tintColor:[UIColor colorWithWhite:1 alpha:0.2] saturationDeltaFactor:1.5 maskImage:nil];
}
- (IBAction)presentPriceList:(id)sender {

    
    TicketsTableViewController *ticketsList =[[TicketsTableViewController alloc] initWithNibName:@"TicketsTableViewController" bundle:nil];
    
    [ticketsList setManagedObjectContext:[FCPCoreDataStore mainQueueContext]];
    [self pushViewController:ticketsList];
}


- (IBAction)presentAirlinesList:(id)sender {
}

- (IBAction)presentTimeTablesLIst:(id)sender {
}

-(void) pushViewController:(UIViewController*) viewController {
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}
@end
