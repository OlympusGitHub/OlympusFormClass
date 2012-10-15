//
//  OAI_ColorManager.m
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import "OAI_ColorManager.h"

@implementation OAI_ColorManager

+(OAI_ColorManager *)sharedColorMaker {
    
    static OAI_ColorManager* sharedColorMaker;
    
    @synchronized(self) {
        
        if (!sharedColorMaker)
            
            sharedColorMaker = [[OAI_ColorManager alloc] init];
        
        return sharedColorMaker;
        
    }
    
}

- (UIColor* ) setColor:(float)red :(float)green :(float)blue {
    
    float newRed = red/255;
    float newGreen = green/255;
    float newBlue = blue/255;
    
    UIColor* colorToReturn = [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1.0];
    
    return colorToReturn;
}

@end
