//
//  ADMountainPath.m
//  Race To The Top
//
//  Created by Angeleah Daidone on 4/5/14.
//  Copyright (c) 2014 Angeleah Daidone. All rights reserved.
//

#import "ADMountainPath.h"

#define PATH_WIDTH 60

@implementation ADMountainPath

+ (NSArray *)mountainPathsForRect:(CGRect)rect
{
    /* Create a NSMutableArray using the literal syntax */
    NSMutableArray *variousPaths = [@[] mutableCopy];
    
    /* Create 9 CGPoints which we will use to create our first path up the mountain. We also create a control point which is required to create curved CGPath's. */
    // First Path
    CGPoint firstPoint = CGPointMake(rect.size.width * (1/6.0), CGRectGetMaxY(rect));
    CGPoint secondPoint = CGPointMake(rect.size.width * (1/3.0), rect.size.height * (5/6.0));
    CGPoint thirdPoint = CGPointMake(CGRectGetMaxX(rect), rect.size.height * (5/6.0));
    CGPoint fourthPoint = CGPointMake(CGRectGetMaxX(rect), rect.size.height * (2/3.0));
    CGPoint fifthPoint = CGPointMake(rect.size.width * (1/6.0), rect.size.height * (6/12.0));
    CGPoint sixthPoint = CGPointMake(rect.size.width * (1/6.0), rect.size.height * (6/12.0));
    CGPoint seventhPoint = CGPointMake(rect.size.width * (1/3.0), rect.size.height * (2/6.0));
    CGPoint eigthPoint = CGPointMake(rect.size.width * (2/3.0), rect.size.height * (6/12.0));
    CGPoint ninthPoint = CGPointMake(rect.size.width * (11/20.0), rect.size.height * (5/24.0));
    CGPoint controlPoint = CGPointMake(rect.size.width * (6 / 8.0), rect.size.height * (1/ 3.0));
    
    /* Create 9 CGPoints which we will use to create our second path up the mountain. We also create a control point which is required to create curved CGPath's. */
    // Second Path
    CGPoint firstPointForSecondPath = CGPointMake(rect.size.width * (1/6.0) - PATH_WIDTH, CGRectGetMaxY(rect));
    CGPoint secondPointForSecondPath = CGPointMake(rect.size.width * (1/3.0), rect.size.height * (5/6.0) - PATH_WIDTH);
    CGPoint thirdPointForSecondPath = CGPointMake(CGRectGetMaxX(rect) - PATH_WIDTH, rect.size.height * (5/6.0) - PATH_WIDTH);
    CGPoint fourthPointForSecondPath = CGPointMake(CGRectGetMaxX(rect)- PATH_WIDTH, rect.size.height * (2/3.0) + PATH_WIDTH);
    CGPoint fifthPointForSecondPath = CGPointMake(rect.size.width * (1/6.0) - PATH_WIDTH, rect.size.height * (6/12.0) + PATH_WIDTH / 2);
    CGPoint sixthPointForSecondPath = CGPointMake(rect.size.width * (1/6.0) - PATH_WIDTH, rect.size.height * (6/12.0));
    CGPoint seventhPointForSecondPath = CGPointMake(rect.size.width * (1/3.0) - PATH_WIDTH / 4, rect.size.height * (2/6.0) - PATH_WIDTH);
    CGPoint eigthPointForSecondPath = CGPointMake(rect.size.width * (2/3.0) - PATH_WIDTH, rect.size.height * (6/12.0) - PATH_WIDTH);
    CGPoint ninthPointForSecondPath = CGPointMake(rect.size.width * (11/20.0) - PATH_WIDTH, rect.size.height * (5/24.0));
    CGPoint controlPointForSecondpath = CGPointMake(rect.size.width * (6 / 8.0) - PATH_WIDTH, rect.size.height * (1/ 3.0));
    
    /* We create a UIBezierPath objects which can be used to setup the geometry of our shape. After we can call stroke or fill to draw the geometrical shape on the screen. We can also set stroke and fill colors */
    UIBezierPath *rightMountainPath = [UIBezierPath bezierPath]; // alternative to alloc, init, nested method calls
    UIBezierPath *leftMountainPath = [UIBezierPath bezierPath];
    
    /* Set the bezier path's line width to be 4 points wide. */
    rightMountainPath.lineWidth = 4.0;
    leftMountainPath.lineWidth = 4.0;
    
    /* We need a start point for the bezier path so we call the method moveToPoint. */
    [rightMountainPath moveToPoint:firstPoint];
    /* addLineToPoint method creates a straight line from the last bezierPath's point to the current point. */
    [rightMountainPath addLineToPoint:secondPoint];
    [rightMountainPath addLineToPoint:thirdPoint];
    [rightMountainPath addLineToPoint:fourthPoint];
    [rightMountainPath addLineToPoint:fifthPoint];
    [rightMountainPath addLineToPoint:sixthPoint];
    [rightMountainPath addLineToPoint:seventhPoint];
    [rightMountainPath addLineToPoint:eigthPoint];
    /* addQuadCurveToPoint method creates a curved line from the last bezierPath's point to the current point. We use a control point to determine the type of curve. */
    [rightMountainPath addQuadCurveToPoint:ninthPoint controlPoint:controlPoint];
    
    [leftMountainPath moveToPoint:firstPointForSecondPath];
    [leftMountainPath addLineToPoint:secondPointForSecondPath];
    [leftMountainPath addLineToPoint:thirdPointForSecondPath];
    [leftMountainPath addLineToPoint:fourthPointForSecondPath];
    [leftMountainPath addLineToPoint:fifthPointForSecondPath];
    [leftMountainPath addLineToPoint:sixthPointForSecondPath];
    [leftMountainPath addLineToPoint:seventhPointForSecondPath];
    [leftMountainPath addLineToPoint:eigthPointForSecondPath];
    [leftMountainPath addQuadCurveToPoint:ninthPointForSecondPath controlPoint:controlPointForSecondpath];
    
    /* Add both the right and and left UIBezierPath objects to the variousPath's array. */
    [variousPaths addObject:rightMountainPath];
    [variousPaths addObject:leftMountainPath];
    return [variousPaths copy];
}

+(UIBezierPath *)tapTargetForPath:(UIBezierPath *)path
{
    CGPathRef tapTargetPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, fmaxf(10.0f, path.lineWidth), path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    
    UIBezierPath *tapTarget = [UIBezierPath bezierPathWithCGPath:tapTargetPath];
    
    CGPathRelease(tapTargetPath);
    
    return tapTarget;
}
@end
