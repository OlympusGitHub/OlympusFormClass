//
//  OAI_Section.m
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import "OAI_Section.h"

@implementation OAI_Section

@synthesize sectionPadding, sectionTitle, sectionNeedsGesture, titleBarBGColor, titleBarBorderW, titleBarH, titleBarHasBorder, titleBarHasRadius, titleBarRadius, titleBarW, titleBarX, titleBarY, originalY, formH;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //instaniate the color manager
        colorManager = [[OAI_ColorManager alloc] init];
        
    }
    return self;
}

- (void) buildSection {
    
    
    if (titleBarHasBorder) {
        self.layer.borderColor = [colorManager setColor:08.0 :25.0 :102.0].CGColor;
        self.layer.borderWidth = 1.0;
    }
    
    if (titleBarHasRadius) {
        self.layer.cornerRadius = titleBarRadius;
    }
    
    if (sectionNeedsGesture) {
        
        //tap gesture is for each section so we can click on it
        UITapGestureRecognizer *sectionTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(checkToggleStatus:)];
        
        //add the gesture
        [self addGestureRecognizer:sectionTap];
    }
   
   
    OAI_TitleLabel* thisTitle = [[OAI_TitleLabel alloc] initWithFrame:CGRectMake(titleBarX, titleBarY, titleBarW, titleBarH)];
    thisTitle.text = sectionTitle;
    
    
    
    [self addSubview:thisTitle];
     
}

- (void) checkToggleStatus : (UIGestureRecognizer*) recognizer {
   
    //get the view
    UIView* thisSection = recognizer.view;
    
    //get the title
    NSArray* sectionSubviews = [thisSection subviews];
    
    //get the label
    OAI_TitleLabel* thisTitleLabel = [sectionSubviews objectAtIndex:0];
    
    NSString* thisTitle = thisTitleLabel.text;
    
    //set up a dictionary to pass back to notification center
    NSMutableDictionary* eventData = [[NSMutableDictionary alloc] init];
    
    //add some objects to it
    NSString* objName = @"Toggle Section";
    [eventData setObject:objName forKey:@"theEvent"];
    [eventData setObject:thisTitle forKey:@"Section Title"];
    [eventData setObject:thisSection forKey:@"Section"];
    
    //call back to the notification center
    [[NSNotificationCenter defaultCenter] postNotificationName:@"theMessenger" object:self userInfo: eventData];
   
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
