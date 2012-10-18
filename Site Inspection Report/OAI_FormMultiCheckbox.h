//
//  OAI_FormMultiCheckbox.h
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/16/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>
#import "OAI_ColorManager.h"
#import "OAI_FormLabel.h"

@interface OAI_FormMultiCheckbox : UIView {
    
    OAI_ColorManager* colorManager;
    
    NSArray* elementData;
    NSString* checkboxName;
    bool isChecked;
    float startX;
    float maxWidth;

    
}

@property (nonatomic, retain) NSArray* elementData;
@property (nonatomic, retain) NSString* checkboxName;
@property (nonatomic, assign) bool isChecked;
@property (nonatomic, assign) float startX;
@property (nonatomic, assign) float maxWidth;



@end
