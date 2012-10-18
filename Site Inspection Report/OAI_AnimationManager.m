
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
            
            //get the section's form data
            NSDictionary* formData = [thisSectionData objectForKey:@"Form Data"];
            
            //get the form
            UIView* thisSectionForm = [formData objectForKey:@"Form"];
                               
            if(thisSectionForm.frame.origin.y == [[formData objectForKey:@"Form Original Y"] floatValue]) {
                
                [self closeOpenSections : thisSection];
                       
                [self openSection:[thisSectionData objectForKey:@"Section"]];
            
            } else {
                
                [self closeOpenSections: thisSection];
                
            }
        }
    }
    
}

- (void) openSection : (UIView* ) sectionToOpen {
    
    //get all the views
    NSArray* allViews = [[sectionToOpen superview] subviews];
   
    //set up an array to hold all the sections and one for forms
    NSMutableArray* allSections = [[NSMutableArray alloc]init];
    NSMutableArray* allForms = [[NSMutableArray alloc]init];
    
    //get the section titles array count
    NSDictionary* firstSectionDict = [_sectionData objectForKey:@"Section_1"];
    int titleCount = [[firstSectionDict objectForKey:@"Section Titles Count"]intValue];
    
    //get all the section views
    for(UIView* thisSubview in allViews) {
        int thisViewTag = thisSubview.tag;
        if(thisViewTag <= titleCount) {
            [allSections addObject:thisSubview];
        } else if (thisViewTag > 100) {
            [allForms addObject:thisSubview];
        }
    }
    
    //determine which section was tapped
    int thisSectionID = sectionToOpen.tag;
    NSString* storedID = [NSString stringWithFormat:@"Section_%i", thisSectionID];
    
    //get it's opened and closed height
    NSDictionary* thisSectionDictionary = [_sectionData objectForKey:storedID];
    
    //get the form data
    NSDictionary* formData = [thisSectionDictionary objectForKey:@"Form Data"];
    
    float formHeight = [[formData objectForKey:@"Form Height"]floatValue];
    
    float thisSectionOpenedHeight = formHeight+ 10.0;
    
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
    
    }
    
    //drop the form into place
    int formToMoveTag = thisSectionID + 100;
    
    for(int f=0; f<allForms.count; f++) {
        
        UIView* thisForm = [allForms objectAtIndex:f];
                 
        int thisFormTag = thisForm.tag;
        
        if(thisFormTag == formToMoveTag) {
         
            CGRect thisFormFrame = thisForm.frame;
            
            thisFormFrame.origin.y = 50.0;
            
            //animate the form
            [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseOut
             
                animations:^{
                    thisForm.frame = thisFormFrame;
                    thisForm.alpha = 1.0;
                }
             
                completion:^ (BOOL finished) {
                }
             ];
            
            break;
            
        }
        
    }
    
    
    
    
}

- (void) closeOpenSections : (UIView* ) thisSection {
    
    //get all the views
    NSArray* allViews = [[thisSection superview] subviews];
    
    //set up an array to hold all the sections and one for forms
    NSMutableArray* allSections = [[NSMutableArray alloc]init];
    NSMutableArray* allForms = [[NSMutableArray alloc]init];
    
    //get the section titles array count
    NSDictionary* firstSectionDict = [_sectionData objectForKey:@"Section_1"];
    int titleCount = [[firstSectionDict objectForKey:@"Section Titles Count"]intValue];
    
    //get all the section views
    for(UIView* thisSubview in allViews) {
        int thisViewTag = thisSubview.tag;
        if(thisViewTag <= titleCount) {
            [allSections addObject:thisSubview];
        } else if (thisViewTag > 100) {
            [allForms addObject:thisSubview];
        }
    }
    
    
    //loop through the section views and check to see if any are out of place
    for(int s=0; s<allSections.count; s++) {
     
        //get the section
        UIView* thisSection = [allSections objectAtIndex:s];
        
        //get the section frame
        CGRect thisSectionFrame = thisSection.frame;
        
        //get the subviews
        NSArray* thisSectionSubviews = thisSection.subviews;
        
        //get the label title
        UILabel* lblSectionTitle = [thisSectionSubviews objectAtIndex:0];
        
        NSString* sectionTitle = lblSectionTitle.text;
        
        NSLog(@"%@", sectionTitle);
        
        float originalY; 
        
        //loop through the sectionData and find a match based on title
        for(NSString* thisSectionStr in _sectionData) {
            
            //get the section dict
            NSDictionary* thisSectionData = [_sectionData objectForKey:thisSectionStr];
            
            //get the title
            NSString* thisSectionTitle = [thisSectionData objectForKey:@"Section Title"];
            
            //compare for match
            if([thisSectionTitle isEqualToString:sectionTitle]) {
                
                //get the original y
                originalY = [[thisSectionData objectForKey:@"Section Original Y"] floatValue];
                
                //comapre to the current y
                if (originalY != thisSectionFrame.origin.y) {
                    
                    //if different, reset to original y
                    thisSectionFrame.origin.y = originalY;
                    
                    //animate the section closing
                    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseOut
                     
                        animations:^{
                            thisSection.frame = thisSectionFrame;
                        }
                     
                        completion:^ (BOOL finished) {
                        }
                    ];
                    
                    [self closeForm:allForms:thisSectionTitle];
                    
                }
                break;
            }
        }
        
    }
    
}

- (void) closeForm : (NSArray*) allForms : (NSString*) thisSectionTitle { 
    
    
    //loop through the sectionData and find a match based on title
    for(NSString* thisSectionStr in _sectionData) {
        
        //get the section dict
        NSDictionary* thisSectionData = [_sectionData objectForKey:thisSectionStr];
        
        if ([thisSectionTitle isEqualToString:[thisSectionData objectForKey:@"Section Title"]]) {
            
            //get form dictionary
            NSDictionary* thisSectionFormData = [thisSectionData objectForKey:@"Form Data"];
            
            //get the original y of the form
            float formOriginalY = [[thisSectionFormData objectForKey:@"Form Original Y"] floatValue];
            
            //get the form
            UIView* thisSectionForm = [thisSectionFormData objectForKey:@"Form"];
            
            //get the form's current frame
            CGRect thisSectionFormFrame = thisSectionForm.frame;
            
            if (thisSectionFormFrame.origin.y != formOriginalY){
                
                NSLog(@"%@:form is open", thisSectionTitle);
            }
        }
        
        
        
    }//end loop through sections
}



@end
