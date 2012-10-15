//
//  OAI_Form.m
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import "OAI_Form.h"

@implementation OAI_Form

@synthesize formData;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        
    }
    return self;
}

- (void) buildForm {
    
    //get the form elements
    NSArray* formElements = [formData objectForKey:@"Form Elements"];
    
    
    //set some props
    float formElementX1 = 5.0;
    float formElementX2 = 165.0;
    float formElementY = 5.0;
    
    //loop through elements
    for(int fe=0; fe<formElements.count; fe++) {
        
        //increment y
        if (fe>0) {
            formElementY = formElementY + 40.0;
        }
        
        //get the element data
        NSArray* thisFormElement = [formElements objectAtIndex:fe];
        
        NSString* formElementName = [thisFormElement objectAtIndex:0];
        NSString* formElementType = [thisFormElement objectAtIndex:1];
        NSString* formElementIsRequired = [thisFormElement objectAtIndex:2];
        
        //build the element label
        OAI_FormLabel* thisFormLabel = [[OAI_FormLabel alloc] initWithFrame:CGRectMake(formElementX1, formElementY, 160.0, 30.0)];
        thisFormLabel.text = formElementName;
        
        [self addSubview:thisFormLabel];
        
        //build the element
        if([formElementType isEqualToString:@"Text Field"]) {
            
            OAI_FormTextField* thisFormElement = [[OAI_FormTextField alloc] initWithFrame:CGRectMake(formElementX2, formElementY, 160.0, 30.0)];
            
            //check to see if it is required
            if ([formElementIsRequired isEqualToString:@"YES"]) {
                thisFormElement.placeholder = @"Required";
            }
            
            [self addSubview:thisFormElement];
        }
        
        
        
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
