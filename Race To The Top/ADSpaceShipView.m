//
//  ADSpaceShipView.m
//  Race To The Top
//
//  Created by Angeleah Daidone on 4/5/14.
//  Copyright (c) 2014 Angeleah Daidone. All rights reserved.
//

#import "ADSpaceShipView.h"

@implementation ADSpaceShipView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2.0;
    
    [bezierPath moveToPoint:CGPointMake(1/6.0 * self.bounds.size.width, 1/3.0 * self.bounds.size.height)];
    
    [bezierPath addLineToPoint:CGPointMake(1/6.0 * self.bounds.size.width, 2/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint:CGPointMake(5/6.0 * self.bounds.size.width, 2/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint:CGPointMake(2/3.0 * self.bounds.size.width, 1/2.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint:CGPointMake(1/3.0 * self.bounds.size.width, 1/2.0 * self.bounds.size.height)];
    
    [bezierPath closePath];
    [bezierPath stroke];
    
    UIBezierPath *cockpitWindowPath = [UIBezierPath bezierPathWithRect:CGRectMake(2/3.0 * self.bounds.size.width,1/2.0 * self.bounds.size.height, 1/6.0 * self.bounds.size.width, 1/12.0 * self.bounds.size.height)];
    [[UIColor blueColor] setFill];
    [cockpitWindowPath fill];
}

@end
