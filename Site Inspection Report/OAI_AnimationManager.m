
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
           
        //get the section data dictionary
        NSDictionary* thisSectionData = [_sectionData objectForKey:thisSectionDataStr];
                      
        //get the section title
        NSString* thisSectionTitle = [thisSectionData objectForKey:@"Section Title"];
           
        if([thisTitle isEqualToString:thisSectionTitle]) {
                   
            if(thisSection.frame.origin.y == [[thisSectionData objectForKey:@"Section Original Y"] floatValue]) {
                       
                [self openSection:[thisSectionData objectForKey:@"Section"]];
            }
        }
    }
    
}

- (void) openSection : (UIView* ) sectionToOpen {
    
    //get all the views
    NSArray* allViews = [[sectionToOpen superview] subviews];
   
    //set up an array to hold all the sections (not forms)
    NSMutableArray* allSections = [[NSMutableArray alloc]init];
    
    //get the section titles array count
    NSDictionary* firstSectionDict = [_sectionData objectForKey:@"Section_1"];
    int titleCount = [[firstSectionDict objectForKey:@"Section Titles Count"]intValue];
    
    //get all the section views
    for(UIView* thisSubview in allViews) {
        int thisViewTag = thisSubview.tag;
        if(thisViewTag <= titleCount) {
            [allSections addObject:thisSubview];
        }
    }
    
    //determine which section was tapped
    int thisSectionID = sectionToOpen.tag;
    NSString* storedID = [NSString stringWithFormat:@"Section_%i", thisSectionID];
    
    //get it's opened and closed height
    NSDictionary* thisSectionDictionary = [_sectionData objectForKey:storedID];
    
    float thisSectionOpenedHeight = 300.0; //this will be the form height + section height, stored in the dictionary, some how : D
    
    float thisSectionClosedHeight = [[thisSectionDictionary objectForKey:@"Section Original Y"] floatValue];
    
    //determine where all the sections need to be moved too
    if (thisSectionID == 1) {
        
        for(int s=0; s<allSections.count; s++) {
            
            if (s>0) {
                
                UIView* thisSection = [allSections objectAtIndex:s];
                
                CGRect thisSectionFrame = thisSection.frame;
                
                thisSectionFrame.origin.y = thisSectionFrame.origin.y + thisSectionOpenedHeight + 10.0;
                
                //animate the view
                [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseOut
                 
                                 animations:^{
                                     thisSection.frame = thisSectionFrame;
                                 }
                 
                                 completion:^ (BOOL finished) {
                                     
                                 }
                 ];
            }
        }
    
    }
    /*
    } else {
        
        float yDifference;
        float currentY;
        
        //move sections
        for(int s=0; s<allSections.count; s++) {
            
            //get the section
            UIView* thisSection = [allSections objectAtIndex:s];
            
            //get its frame
            CGRect thisSectionFrame = thisSection.frame;
            
            if (s+1 == thisSectionID) {
                
                //current y location
                currentY = thisSectionFrame.origin.y;
                yDifference = (currentY - 10.0);
                
                float newYLocation = 10.0;
                thisSectionFrame.origin.y = newYLocation;
                
            } else if (s+1 < thisSectionID) {
                
                //set new y
                float newYLocation = (s+1) * -50;
                thisSectionFrame.origin.y = newYLocation;
                
                
            } else {
                
                float newYLocation = (thisSectionFrame.origin.y + thisSectionOpenedHeight) - (currentY - 20.0);
                
                thisSectionFrame.origin.y = newYLocation;
                
            }
            
            //animate the sections
            [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseOut
             
                             animations:^{
                                 thisSection.frame = thisSectionFrame;
                             }
             
                             completion:^ (BOOL finished) {
                             }
             ];
            
        }
      */  
    
    
    
}

- (void) closeSection : (NSString* ) sectionTitle {
    
}



@end
