//
//  OAI_Form.h
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "OAI_ColorManager.h"
#import "OAI_FormLabel.h"
#import "OAI_FormTextField.h"
#import "OAI_FormCheckbox.h"
#import "OAI_FormMultiCheckbox.h"
#import "OAI_States.h"
#import "OAI_Countries.h"

@interface OAI_Form : UIView <UITableViewDataSource, UITableViewDelegate> {
    
    NSMutableDictionary* formData;
    OAI_ColorManager* colorManager;
    
    OAI_States* statesManager;
    OAI_Countries* countriesManager;
    
    NSArray* states;
    NSArray* countries;
    
}

@property (nonatomic, retain) NSMutableDictionary* formData;

- (void) buildForm;

- (void) buildStateDropDown;

- (void) buildCountryDropDown;

@end
