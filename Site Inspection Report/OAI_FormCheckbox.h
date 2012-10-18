//
//  OAI_FormCheckbox.h
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/16/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "OAI_ColorManager.h"

@interface OAI_FormCheckbox : UIView {
    
    OAI_ColorManager* colorManager;
    
    NSString* checkboxName;
    bool isChecked;
    
}

@property (nonatomic, retain) NSString* checkboxName;
@property (nonatomic, assign) bool isChecked;


- (void) showCheck;

- (void) hideCheck;
@end
