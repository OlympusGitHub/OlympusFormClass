//
//  OAI_AnimationManager.h
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OAI_AnimationManager : NSObject

@property (nonatomic, retain) NSMutableDictionary* sectionData;

+(OAI_AnimationManager* )sharedAnimationManager;

- (void) checkToggleStatus : (UIView* ) thisSection : (NSString* ) thisTitle;

- (void) openSection : (NSString* ) sectionTitle;

- (void) closeOpenSections : (UIView* ) thisSection;

- (void) closeForm : (NSArray*) allForms : (NSString*) thisSectionTitle;

@end
