//
//  OAI_FormTextField.m
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import "OAI_FormTextField.h"

@implementation OAI_FormTextField

@synthesize isEmail, isPhone;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.font = [UIFont fontWithName:@"Helvetica" size:18.0];
        self.textColor = [UIColor blackColor];
        self.borderStyle = UITextBorderStyleRoundedRect;
        self.backgroundColor = [UIColor whiteColor];
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
