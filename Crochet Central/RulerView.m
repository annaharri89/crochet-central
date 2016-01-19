//
//  RulerView.m
//  Crochet Central
//
//  Created by Anna Harrison on 3/7/13.
//  Copyright (c) 2013 Anna Harrison. All rights reserved.
//

#import "RulerView.h"

BOOL const *unitsSegmentSelected = TRUE;

@implementation RulerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

void drawRulerNumbers (CGContextRef myContext, CGRect contextRect, NSInteger currentX, NSInteger currentY, NSInteger currentNum) // 1
{
    NSString *currentNumStr = [NSString stringWithFormat:@"%d ", currentNum];
    const char *currentNumChar = [currentNumStr UTF8String];
    CGContextShowTextAtPoint (myContext, currentX, currentY, currentNumChar, 2);
}

void setLargeTickSettings (CGContextRef currentContext, CGRect contextRect)
{
    CGFloat dashArray[] = {};
    CGContextSetLineDash(currentContext, 0, dashArray, 0);
    CGContextSetStrokeColorWithColor(currentContext, [UIColor blueColor].CGColor);
}

void setMediumTickSettings (CGContextRef currentContext, CGRect contextRect)
{
    CGFloat dashArray[] = {10, 10};
    CGContextSetLineDash(currentContext, 3, dashArray, 4);
    CGContextSetStrokeColorWithColor(currentContext, [UIColor redColor].CGColor);
}

void setSmallTickSettings (CGContextRef currentContext, CGRect contextRect)
{
    CGFloat dashArray[] = {};
    CGContextSetLineDash(currentContext, 0, dashArray, 0);
    CGContextSetStrokeColorWithColor(currentContext, [UIColor redColor].CGColor);
}

void drawLeftRuler (CGContextRef currentContext, CGRect contextRect, NSInteger totalTicks, NSInteger largeTickInterval)
{
    // Drawing code
    NSInteger currentWidth = CGRectGetWidth(contextRect);//DON'T CHANGE TO currentHeight: needed to get to the other side of screen
    NSInteger smallTickCounter = 0;
    NSInteger currentNum = 1;
    NSInteger tickOffset = 20;
    
    CGFloat smallTickSpacingInPixels = CGRectGetHeight(contextRect) / (CGFloat)totalTicks;
    
    //----------------------Height----------------------
    for (NSInteger currentTickNumber = 0; currentTickNumber < totalTicks; currentTickNumber++)
    {
        //Position of tick marks
        CGContextMoveToPoint(currentContext, 0, round(currentTickNumber * smallTickSpacingInPixels) + tickOffset);
        
        smallTickCounter++;
        
        if (smallTickCounter == largeTickInterval)
        {
            //Large Tick Mark
            setLargeTickSettings(currentContext, contextRect);
            CGContextAddLineToPoint(currentContext, currentWidth, round(currentTickNumber * smallTickSpacingInPixels) + tickOffset);
            drawRulerNumbers(currentContext, contextRect, 30, round(currentTickNumber * smallTickSpacingInPixels), currentNum);
            
            currentNum ++;
            smallTickCounter = 0;
            
            CGContextStrokePath(currentContext);
        }
        else if (smallTickCounter == (0.5 * largeTickInterval))
        {
            //Middle Tick Mark
            setMediumTickSettings(currentContext, contextRect);
            CGContextAddLineToPoint(currentContext, currentWidth, round(currentTickNumber * smallTickSpacingInPixels) + tickOffset);
            CGContextStrokePath(currentContext);
        }
        else
        {
            //Small Tick Mark
            setSmallTickSettings(currentContext, contextRect);
            CGContextAddLineToPoint(currentContext, 20, round(currentTickNumber * smallTickSpacingInPixels) + tickOffset);
            CGContextStrokePath(currentContext);
        }
    }
}

void drawBottomRuler (CGContextRef currentContext, CGRect contextRect, NSInteger totalTicks, NSInteger largeTickInterval)
{
    // Drawing code
    NSInteger currentHeight = CGRectGetHeight(contextRect);//DON'T CHANGE TO currentWidth: needed to get to the bottom of the screen
    NSInteger smallTickCounter = 0;
    NSInteger currentNum = 1;
    NSInteger tickOffset = 20;
    
    CGFloat smallTickSpacingInPixels = CGRectGetWidth(contextRect) / (CGFloat)totalTicks;
    
    //----------------------Width----------------------
    for (NSInteger currentTickNumber = 0; currentTickNumber < totalTicks; currentTickNumber++)
    {
        //Position of tick marks
        CGContextMoveToPoint(currentContext, round(currentTickNumber * smallTickSpacingInPixels) + tickOffset, 0);
        
        smallTickCounter++;
        
        if (smallTickCounter == largeTickInterval)
        {
            //Large Tick Mark
            setLargeTickSettings(currentContext, contextRect);
            CGContextAddLineToPoint(currentContext, round(currentTickNumber * smallTickSpacingInPixels) + tickOffset, currentHeight);
            drawRulerNumbers(currentContext, contextRect, round(currentTickNumber * smallTickSpacingInPixels), 30, currentNum);
            
            currentNum ++;
            smallTickCounter = 0;
            
            CGContextStrokePath(currentContext);
        }
        else if (smallTickCounter == (0.5 * largeTickInterval))
        {
            //Middle Tick Mark
            setMediumTickSettings(currentContext, contextRect);
            CGContextAddLineToPoint(currentContext, round(currentTickNumber * smallTickSpacingInPixels) + tickOffset, currentHeight);
            CGContextStrokePath(currentContext);
            
        }
        else
        {
            //Small Tick Mark
            setSmallTickSettings(currentContext, contextRect);
            CGContextAddLineToPoint(currentContext, round(currentTickNumber * smallTickSpacingInPixels) + tickOffset, 20);
            CGContextStrokePath(currentContext);
            
        }
    }
}

void drawInchRuler(CGContextRef currentContext, CGRect contextRect)
{
    //Total Ticks per inch: 8 (known as the largeTickInterval in draw___Ruler methods)
    
    //Height of physical screen: 4 and 7/8 inches, 8 ticks per inch, (4*8+7 = 39 tick marks)
    drawLeftRuler(currentContext, contextRect, 39, 8);
    
    //Width: 7 and 5/8 inches for width (7*8+5 = 61 tick marks)
    drawBottomRuler(currentContext, contextRect, 61, 8);

    CGContextSetLineWidth(currentContext, 2);
    CGContextSetStrokeColorWithColor(currentContext, [UIColor yellowColor].CGColor);
    CGContextMoveToPoint(currentContext, 0, 0);
    CGContextAddLineToPoint(currentContext, 20, 0);
    CGContextMoveToPoint(currentContext, 1, 0);
    CGContextAddLineToPoint(currentContext, 1, 20);
    CGContextStrokePath(currentContext);
    CGContextSetLineWidth(currentContext, 1);
    
    CGContextShowTextAtPoint (currentContext, 5, 3, "0", 1);
}

void drawCentimeterRuler(CGContextRef currentContext, CGRect contextRect)
{
    //Total Ticks per centimeter: 10 (known as the largeTickInterval in draw___Ruler methods)
    
    //Height of physical screen: 12.2 centimeters, 10 ticks per cm, (12*10+2 = 122 tick marks)
    drawLeftRuler(currentContext, contextRect, 122, 10);
    
    //Width: 19.3 centimeters for width (19*10+3 = 193 tick marks)
    drawBottomRuler(currentContext, contextRect, 193, 10);
    
    CGContextSetLineWidth(currentContext, 2);
    CGContextSetStrokeColorWithColor(currentContext, [UIColor yellowColor].CGColor);
    CGRect startRect = CGRectMake(-1, -1, 16, 16);
    CGContextStrokeRect(currentContext, startRect);
    CGContextSetLineWidth(currentContext, 1);
    
    CGContextShowTextAtPoint (currentContext, 3, 1, "0", 1);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextTranslateCTM(context, - 0.5, rect.size.height - 0.5);
    CGContextScaleCTM(context, 1, -1);
    CGContextSelectFont (context,
                         "Helvetica",
                         20,
                         kCGEncodingMacRoman);
    
    //CGContextSetLineWidth(context, 1);
    
    if (unitsSegmentSelected){
        drawInchRuler(context, rect);
    }
    else {
        drawCentimeterRuler(context, rect);
    }
}

- (IBAction)unitSegmentChanged:(id)sender {
    if(self.unitsSegment.selectedSegmentIndex == 0){
        unitsSegmentSelected = TRUE;
	}
	if(self.unitsSegment.selectedSegmentIndex == 1){
        unitsSegmentSelected = FALSE;
	}
    [self setNeedsDisplay];
}
@end
