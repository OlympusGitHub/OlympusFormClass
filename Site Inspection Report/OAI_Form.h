//
//  OAI_Form.h
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OAI_ColorManager.h"
#import "OAI_FormLabel.h"
#import "OAI_FormTextField.h"

@interface OAI_Form : UIView {
    
    NSMutableDictionary* formData;
    
}

@property (nonatomic, retain) NSMutableDictionary* formData;

- (void) buildForm;

@end
