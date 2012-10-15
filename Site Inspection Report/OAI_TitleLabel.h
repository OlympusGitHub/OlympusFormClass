//
//  OAI_TitleLabel.h
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OAI_ColorManager.h"

@interface OAI_TitleLabel : UILabel {
    
    OAI_ColorManager* colorManager;

}

@property (nonatomic, retain) UIColor* titleBarTextColor;

@end
