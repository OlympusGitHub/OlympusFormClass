//
//  OAI_FormMultiCheckbox.m
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/16/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import "OAI_FormMultiCheckbox.h"

@implementation OAI_FormMultiCheckbox

@synthesize elementData, isChecked, checkboxName, maxWidth, startX;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        colorManager = [[OAI_ColorManager alloc] init];
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
