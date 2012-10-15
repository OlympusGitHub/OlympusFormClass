//
//  OAI_TitleLabel.m
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import "OAI_TitleLabel.h"

@implementation OAI_TitleLabel

@synthesize titleBarTextColor;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        colorManager = [[OAI_ColorManager alloc] init];
        
        self.font = [UIFont fontWithName:@"Helvetica" size:24.0];
        self.textColor = [colorManager setColor:08.0 :25.0 :102.0];
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
