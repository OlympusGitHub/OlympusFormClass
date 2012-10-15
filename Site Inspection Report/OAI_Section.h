//
//  OAI_Section.h
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "OAI_ColorManager.h"
#import "OAI_TitleLabel.h"

@interface OAI_Section : UIView {
    
    //define section properties
    NSString* sectionTitle;
    float sectionPadding;
    bool sectionNeedsGesture;
    float originalY;
    
    //define title bar properties
    float titleBarX;
    float titleBarY;
    float titleBarW;
    float titleBarH;
    bool titleBarHasBorder;
    float titleBarBorderW;
    UIColor* titleBarBGColor;
    bool titleBarHasRadius;
    float titleBarRadius;
    
    OAI_ColorManager* colorManager;
    OAI_TitleLabel* lblSectionTitle;
    
}

@property (nonatomic, retain) NSString* sectionTitle;
@property (nonatomic, assign) float sectionPadding;
@property (nonatomic, assign) bool sectionNeedsGesture;
@property (nonatomic, assign) float originalY;
@property (nonatomic, assign) float titleBarX;
@property (nonatomic, assign) float titleBarY;
@property (nonatomic, assign) float titleBarW;
@property (nonatomic, assign) float titleBarH;
@property (nonatomic, assign) bool titleBarHasBorder;
@property (nonatomic, assign) float titleBarBorderW;
@property (nonatomic, retain) UIColor* titleBarBGColor;
@property (nonatomic, assign) bool titleBarHasRadius;
@property (nonatomic, assign) float titleBarRadius;

- (void) buildSection;

- (void) checkToggleStatus;

@end
