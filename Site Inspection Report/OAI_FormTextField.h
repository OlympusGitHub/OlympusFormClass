//
//  OAI_FormTextField.h
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OAI_FormTextField : UITextField {
    
    bool isPhone;
    bool isEmail;
    
}

@property (nonatomic, assign) bool isPhone;
@property (nonatomic, assign) bool isEmail;

@end
