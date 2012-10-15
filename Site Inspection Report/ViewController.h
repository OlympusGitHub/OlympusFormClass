//
//  ViewController.h
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OAI_Section.h"
#import "OAI_ColorManager.h"
#import "OAI_AnimationManager.h"
#import "OAI_Form.h"

@interface ViewController : UIViewController {
    
    OAI_ColorManager* colorManager;
    OAI_AnimationManager* animationManager;
    
    NSMutableDictionary* sectionData;
    
}

@property (nonatomic, retain) NSMutableDictionary* sectionData;

- (NSMutableDictionary* ) setFormData : (int) thisTag : (UIView* ) thisSection;
@end
