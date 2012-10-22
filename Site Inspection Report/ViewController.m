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
    
    //add section title to the section dict
    
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
                [NSString stringWithFormat:@"%i",sectionTitles.count], @"Section Titles Count",
                thisSection.subviews, @"Section Subviews",
                thisSection, @"Section",
            nil];
        
        
        //set the form data
        NSMutableDictionary* formData = [self setFormData:tagCount:thisSection];
        
        //add it to the temp dict
        [tempDictionary setObject:formData forKey:@"Form Data"];
        
        //add this section dict to the sectionData dict
        [sectionData setObject:tempDictionary forKey:[NSString stringWithFormat:@"Section_%i", s+1]];
        
        //store section data in animation manager
        animationManager.sectionData = sectionData;
        
        [self.view addSubview:thisSection];
    }
    
}

#pragma mark Set Form Data
- (NSMutableDictionary* ) setFormData : (int) thisTag : (OAI_Section* ) thisSection {
    
    //the form
    OAI_Form* thisForm = [[OAI_Form alloc] init];
    
    //init dict
    NSMutableDictionary* formData = [[NSMutableDictionary alloc] init];    
    
    //props
    float formH;
    float formW = thisSection.frame.size.width;
    float formX = thisSection.frame.origin.x;
    float formY = 0.0;
    
    //form elements
    if (thisTag == 1) {
        
        //dict to hold form elements
        NSMutableArray* formElements = [[NSMutableArray alloc] init];
        
        [formElements addObject:@"Site Inspecition Report"];
        
         [formElements addObject:
          [[NSMutableDictionary alloc] initWithObjectsAndKeys:
            @"Project Number:", @"Field Name",
            @"Text Field", @"Field Type",
            @"YES", @"isRequired",
            @"Medium", @"Field Size",
          nil]];
        
        
         [formElements addObject:
          [[NSMutableDictionary alloc] initWithObjectsAndKeys:
            @"Inspection Date:", @"Field Name",
            @"Text Field", @"Field Type",
            @"YES", @"isRequired",
            @"Medium", @"Field Size",
          nil]];
        
        
         [formElements addObject:
          [[NSMutableDictionary alloc] initWithObjectsAndKeys:
            @"Prepared By:", @"Field Name",
            @"Text Field", @"Field Type",
            @"YES", @"isRequired",
            @"Medium", @"Field Size",
          nil]];
        
        
         [formElements addObject:
          [[NSMutableDictionary alloc] initWithObjectsAndKeys:
            @"Revised Date:", @"Field Name",
            @"Text Field", @"Field Type",
            @"YES", @"isRequired",
            @"Medium", @"Field Size",
          nil]];
        
        
         [formElements addObject:
          [[NSMutableDictionary alloc] initWithObjectsAndKeys:
            @"Revised By:", @"Field Name",
            @"Text Field", @"Field Type",
            @"YES", @"isRequired",
            @"Medium", @"Field Size",
          nil]];
                
        [formData setObject:formElements forKey:@"Form Elements"];
        
    } else if (thisTag == 2) {
        
        //dict to hold form elements
        NSMutableArray* formElements = [[NSMutableArray alloc] init];
        
        [formElements addObject:@"EndoAlpha Solution"];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Endo Alpha Control:", @"Field Name",
                @"MultiCheckbox", @"Field Type",
                @"YES", @"isRequired",
                @"N/A", @"Field Size",
                [[NSArray alloc] initWithObjects:@"AVP", @"UCES-3",nil], @"Checkboxes",
             nil]
         ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Endo Alpha Control:", @"Field Name",
                @"MultiCheckbox", @"Field Type",
                @"YES", @"isRequired",
                @"N/A", @"Field Size",
                [[NSArray alloc] initWithObjects:@"HD Recording", @"SD Recording",nil], @"Checkboxes",
             nil]
         ];
        
        
        [formData setObject:formElements forKey:@"Form Elements"];
       
    
    } else if (thisTag == 3) {
        
        //dict to hold form elements
        NSMutableArray* formElements = [[NSMutableArray alloc] init];
        
        [formElements addObject:@"Hospital Information"];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Hospital  Address:", @"Field Name",
                @"Section", @"Field Type",
                @"N/A", @"isRequired",
                @"Width", @"Field Size",
                @"2", @"Text Indent",
             nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Hospital  Name:", @"Field Name",
                @"Text Field", @"Field Type",
                @"YES", @"isRequired",
                @"Width", @"Field Size",
             nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Address:", @"Field Name",
                @"Text Field", @"Field Type",
                @"YES", @"isRequired",
                @"Width", @"Field Size",
             nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"City:", @"Field Name",
                @"Text Field", @"Field Type",
                @"YES", @"isRequired",
                @"Large", @"Field Size",
             nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"State:", @"Field Name",
                @"Table", @"Field Type",
                @"YES", @"isRequired",
                @"Small", @"Field Size",
             nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Zip:", @"Field Name",
                @"Text Field", @"Field Type",
                @"YES", @"isRequired",
                @"Small", @"Field Size",
             nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Country:", @"Field Name",
                @"Text Field", @"Field Type",
                @"YES", @"isRequired",
                @"Medium", @"Field Size",
             nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Relevant Contacts:", @"Field Name",
                @"Section", @"Field Type",
                @"N/A", @"isRequired",
                @"Width", @"Field Size",
                @"2", @"Text Indent",
             nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Hospital Management:", @"Field Name",
                @"Text Field", @"Field Type",
                @"NO", @"isRequired",
                @"Medium", @"Field Size",
                @"YES", @"isContact",
            nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Hospital Project Manager:", @"Field Name",
                @"Text Field", @"Field Type",
                @"NO", @"isRequired",
                @"Medium", @"Field Size",
                @"YES", @"isContact",
                [[NSArray alloc] initWithObjects:@"Phone:", @"Email:", nil], @"ContactData",
            nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Facility Management:", @"Field Name",
                @"Text Field", @"Field Type",
                @"NO", @"isRequired",
                @"Medium", @"Field Size",
                @"YES", @"isContact",
                [[NSArray alloc] initWithObjects:@"Phone:", @"Email:", nil], @"ContactData",
            nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Biomedical Department:", @"Field Name",
                @"Text Field", @"Field Type",
                @"NO", @"isRequired",
                @"Medium", @"Field Size",
                @"YES", @"isContact",
                [[NSArray alloc] initWithObjects:@"Phone:", @"Email:", nil], @"ContactData",
            nil]
         ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Biomedical Department:", @"Field Name",
                @"Text Field", @"Field Type",
                @"NO", @"isRequired",
                @"Medium", @"Field Size",
                @"YES", @"isContact",
                [[NSArray alloc] initWithObjects:@"Phone:", @"Email:", nil], @"ContactData",
            nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"IT Department:", @"Field Name",
                @"Text Field", @"Field Type",
                @"NO", @"isRequired",
                @"Medium", @"Field Size",
                @"YES", @"isContact",
                [[NSArray alloc] initWithObjects:@"Phone:", @"Email:", nil], @"ContactData",
            nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Shipping Receiving:", @"Field Name",
                @"Text Field", @"Field Type",
                @"NO", @"isRequired",
                @"Medium", @"Field Size",
                @"YES", @"isContact",
                [[NSArray alloc] initWithObjects:@"Phone:", @"Email:", nil], @"ContactData",
            nil]
         ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Shipping Receiving:", @"Field Name",
                @"Text Field", @"Field Type",
                @"NO", @"isRequired",
                @"Medium", @"Field Size",
                @"YES", @"isContact",
                [[NSArray alloc] initWithObjects:@"Phone:", @"Email:", nil], @"ContactData",
            nil]
         ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Boom Manufaturer:", @"Field Name",
                @"Text Field", @"Field Type",
                @"NO", @"isRequired",
                @"Medium", @"Field Size",
                @"YES", @"isContact",
                [[NSArray alloc] initWithObjects:@"Phone:", @"Email:", nil], @"ContactData",
             nil]
        ];
        
        [formElements addObject:
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                @"Other (Specify):", @"Field Name",
                @"Text Field", @"Field Type",
                @"NO", @"isRequired",
                @"Medium", @"Field Size",
                @"YES", @"isContact",
                [[NSArray alloc] initWithObjects:@"Phone:", @"Email:", nil], @"ContactData",
            nil]
        ];
        
        [formData setObject:formElements forKey:@"Form Elements"];
                
    } else if (thisTag == 4) {
        
        /*[formElements addObject:[[NSArray alloc] initWithObjects:@" Operating Room:", @"Section", @"NO", @"Width", @"1", @"YES", @"+", nil]];
        
        [formElements addObject:[[NSArray alloc] initWithObjects:@" 1st Operating Room Dimensions:", @"SubSection", @"NO", @"Width", @"5", @"NO", nil]];
    
        [[NSArray alloc] initWithObjects:
            @"2",
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                [[NSArray alloc] initWithObjects:@"Length (ft):", @"Text Field", @"YES", @"Medium", nil], @"Col1:1",
                [[NSArray alloc] initWithObjects:@"Width (ft):", @"Text Field", @"YES", @"Medium", nil], @"Col1:2",
            nil],
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                [[NSArray alloc] initWithObjects:@"Height (ft):", @"Text Field", @"YES", @"Medium", nil], @"Col1:1",
                [[NSArray alloc] initWithObjects:@"Width (ft):", @"Text Field", @"YES", @"Medium", nil], @"Col1:2",
             nil],
         nil];
        
            [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                [[NSArray alloc] initWithObjects:@"Length (ft):", @"Text Field", @"YES", @"Medium"], @"Col1:1"],
                [[NSArray alloc] initWithObjects:@"Width (ft):", @"Text Field", @"YES", @"Medium"], @"Col1:2"],
            nil]
            
      
        
        //calculate form height
        formH = formElements.count * 40;//30 height for each element, 10 spacing*/
        
    } else if (thisTag == 5) {
        
        /*[formElements addObject:[[NSArray alloc] initWithObjects:@"Project Number:", @"Text Field", @"YES", @"Medium", nil]];
        
        //calculate form height
        formH = formElements.count * 40;//30 height for each element, 10 spacing*/
        
    } else if (thisTag == 6) {
        
        /*[formElements addObject:[[NSArray alloc] initWithObjects:@"Project Number:", @"Text Field", @"YES", @"Medium", nil]];
        
        //calculate form height
        formH = formElements.count * 40;//30 height for each element, 10 spacing*/
    
    }
        
    //populate form data dictionary
    [formData setObject: thisSection.sectionTitle forKey:@"Form Title"];
    
    NSArray* elements = [formData objectForKey:@"Form Elements"];
    for(int e=0; e<elements.count; e++) {
        
        if (e>0) { 
            NSDictionary* thisElement = [elements objectAtIndex:e];
            NSString* thisElementType = [thisElement objectForKey:@"Field Type"];
        
            if ([thisElementType isEqualToString:@"Table"]) {
                formH = formH + 120.0;
            } else {
                bool isContact = [thisElement objectForKey:@"isContact"];
                
                if (isContact) {
                    formH = formH + 75.0;
                } else { 
                    formH = formH + 40.0;
                }
            }
        }
    }
    
    [formData setObject:[NSString stringWithFormat:@"%f", formH] forKey:@"Form Height"];
    [formData setObject:[NSString stringWithFormat:@"%f", formY-formH] forKey:@"Form Original Y"];
    [formData setObject:thisForm forKey:@"Form"];

    //pass the form data to the form
    thisForm.formData = formData;
        
    //reset the form frame
    CGRect formFrame = CGRectMake(formX, formY-formH, formW, formH);
    thisForm.frame = formFrame;
    
    //set the form tag
    thisForm.tag = thisTag + 100;
        
    //build the form
    [thisForm buildForm];
    
    thisForm.alpha = 0.0;
    
    //add the form to the vc
    [self.view addSubview:thisForm];
    
    return formData;
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
