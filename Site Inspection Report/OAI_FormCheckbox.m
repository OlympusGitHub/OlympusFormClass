//
//  OAI_FormCheckbox.m
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/16/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import "OAI_FormCheckbox.h"

@implementation OAI_FormCheckbox

@synthesize isChecked, checkboxName;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        colorManager = [[OAI_ColorManager alloc] init];
        
        self.layer.borderColor = [colorManager setColor:08.0 :25.0 :102.0].CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 5.0;
    }
    return self;
}

- (void) showCheck {
    
    UIImageView* checkmark = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"checkmark.png"]];
    [self addSubview:checkmark];
    
}

- (void) hideCheck {
    
    NSArray* subviews = self.subviews;
    
    //loop through the subviews
    for(UIView* thisView in subviews) {
        
        [thisView removeFromSuperview];
    }
    
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
