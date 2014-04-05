//
//  ADViewController.m
//  Race To The Top
//
//  Created by Angeleah Daidone on 4/5/14.
//  Copyright (c) 2014 Angeleah Daidone. All rights reserved.
//

#import "ADViewController.h"
#import "ADPathView.h"
#import "ADMountainPath.h"

#define ADMAP_STARTING_SCORE 15000
#define ADMAP_SCORE_DECREMENT_AMOUNT 100
#define ADTIMER_INTERVAL 0.1
#define ADWALL_PENALTY 500

@interface ADViewController ()
@property (strong, nonatomic) IBOutlet ADPathView *pathView;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapRecognizer.numberOfTapsRequired = 2;
    [self.pathView addGestureRecognizer:tapRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
    [self.pathView addGestureRecognizer:panRecognizer];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:ADTIMER_INTERVAL target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", ADMAP_STARTING_SCORE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)panDetected:(UIPanGestureRecognizer *) panRecognizer
{
    CGPoint fingerLocation = [panRecognizer locationInView:self.pathView];
    
    for (UIBezierPath *path in [ADMountainPath mountainPathsForRect:self.pathView.bounds]) {
        UIBezierPath *tapTarget = [ADMountainPath tapTargetForPath:path];
        
        if ([tapTarget containsPoint:fingerLocation]) {
            [self decrementScoreByAmount:ADWALL_PENALTY];
        }
    }
}

-(void)tapDetected:(UITapGestureRecognizer *)tapRecognizer
{
    NSLog(@"Tapped!");
    CGPoint tapLocation = [tapRecognizer locationInView:self.pathView];
    NSLog(@"tap location is at (%f, %f)",tapLocation.x, tapLocation.y);
}

-(void)timerFired
{
    [self decrementScoreByAmount:ADMAP_SCORE_DECREMENT_AMOUNT];
}

-(void)decrementScoreByAmount:(int)amount
{
    NSString *scoreText = [[self.scoreLabel.text componentsSeparatedByString:@" "] lastObject];
    int score = [scoreText intValue];
    score = score - amount;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", score];
}

@end
