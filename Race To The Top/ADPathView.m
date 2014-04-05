//
//  ADPathView.m
//  Race To The Top
//
//  Created by Angeleah Daidone on 4/5/14.
//  Copyright (c) 2014 Angeleah Daidone. All rights reserved.
//

#import "ADPathView.h"
#import "ADMountainPath.h"

@implementation ADPathView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.backgroundColor = [UIColor clearColor];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    for (UIBezierPath *path in [ADMountainPath mountainPathsForRect:self.bounds]) {
        [[UIColor blackColor] setStroke];
        [path stroke];
    }
    
}

@end
