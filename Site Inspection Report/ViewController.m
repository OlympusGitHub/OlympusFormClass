//
//  ViewController.m
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize sectionData;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //instaniate the color manager
    colorManager = [[OAI_ColorManager alloc]init];
    
    //instantiate the animation manager
    animationManager = [[OAI_AnimationManager alloc] init];
    
    //instantiate the section data dictionary
    sectionData = [[NSMutableDictionary alloc] init];
    
    //setting up a noification center
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"theMessenger"object:nil];

    NSArray* sectionTitles = [[NSArray alloc] initWithObjects:@"Site Inspection Report", @"EndoAlpha Solution", @"Hospital Information", @"General Description Of Site", @"Pre-Installation Requirement Checklist", @"Miscellaneous Information", nil];
    
    float sectionX = 10.0;
    float sectionY = 5.0;
    float sectionSpacing = 5.0;
    float sectionH = 40.0;
    float tagCount = 0;
    
    for(int s=0; s<sectionTitles.count; s++) {
        
        //increment y
        if(s>0) {
            sectionY = sectionY + (sectionH + sectionSpacing);
        }
        
        tagCount = tagCount + 1;
        
        //instantiate a new section
        OAI_Section* thisSection = [[OAI_Section alloc]initWithFrame:CGRectMake(sectionX, sectionY, 748.0, 40.0)];
        
        //set background color
        thisSection.backgroundColor = [colorManager setColor:204.0 :204.0 :204.0];
        
        //set up titlebar props
        thisSection.sectionTitle = [sectionTitles objectAtIndex:s];
        thisSection.sectionNeedsGesture = YES;
        thisSection.sectionPadding = 5.0;
        thisSection.titleBarHasBorder = YES;
        thisSection.titleBarHasRadius = YES;
        thisSection.titleBarRadius = 4.0;
        thisSection.titleBarBGColor = [colorManager setColor:204.0 :204.0 :204.0];
        thisSection.sectionPadding = 3.0;
        thisSection.titleBarX = 7.0;
        thisSection.titleBarY = 5.0;
        thisSection.titleBarW = thisSection.frame.size.width - (thisSection.titleBarX);
        thisSection.titleBarH = thisSection.frame.size.height - thisSection.titleBarY;
        
        [thisSection buildSection];
        thisSection.tag = tagCount;
        
        //dump data into temp dictionary
        NSMutableDictionary* tempDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                [sectionTitles objectAtIndex:s], @"Section Title",
                [NSString stringWithFormat:@"%f", thisSection.frame.origin.y], @"Section Original Y",
                [NSString stringWithFormat:@"%f",thisSection.frame.origin.x], @"Section Original X",
                [NSString stringWithFormat:@"%f",thisSection.frame.size.width], @"Section Original W",
                [NSString stringWithFormat:@"%f",thisSection.frame.size.height], @"Section Original H",
                thisSection.subviews, @"Section Subviews",
            nil];
        
        [sectionData setObject:tempDictionary forKey:[NSString stringWithFormat:@"Section_%i", s]];
        
        animationManager.sectionData = sectionData;
        
        [self.view addSubview:thisSection];
    }
    
   
}

#pragma mark Notification Center
- (void) receiveNotification:(NSNotification* ) notification {
    
    if ([[notification name] isEqualToString:@"theMessenger"]) {
        
        //get the event
        NSString* theEvent = [[notification userInfo] objectForKey:@"theEvent"];
        
        if ([theEvent isEqualToString:@"Toggle Section"]) {
            
            //get the section and section title
            OAI_Section* thisSection = [[notification userInfo] objectForKey:@"Section"];
            NSString* thisTitle = [[notification userInfo] objectForKey:@"Section Title"];
            
            //pass to animation manager
            [animationManager checkToggleStatus:thisSection :thisTitle];
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
