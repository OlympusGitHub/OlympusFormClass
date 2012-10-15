
//
//  OAI_AnimationManager.m
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import "OAI_AnimationManager.h"

@implementation OAI_AnimationManager

@synthesize sectionData = _sectionData;

+(OAI_AnimationManager *)sharedAnimationManager {
    
    static OAI_AnimationManager* sharedAnimationManager;
    
    @synchronized(self) {
        
        if (!sharedAnimationManager)
            
            sharedAnimationManager = [[OAI_AnimationManager alloc] init];
        
        return sharedAnimationManager;
        
    }
    
}

- (void) checkToggleStatus : (UIView* ) thisSection : (NSString* ) thisTitle {
    
    for(NSString* thisSectionDataStr in _sectionData) {
        
        NSDictionary* thisSectionData = [_sectionData objectForKey:thisSectionDataStr];
        NSLog(@"%@", thisSectionData);
        
        NSString* thisSectionTitle = [thisSectionData objectForKey:@"Section Title"];
        
        if([thisSectionTitle isEqualToString:thisTitle]) {
            
                       
        }
    }
}



@end
