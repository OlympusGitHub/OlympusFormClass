//
//  OAI_Form.m
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import "OAI_Form.h"

@implementation OAI_Form

@synthesize formData;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        colorManager = [[OAI_ColorManager alloc]init];
        
        states = [[NSArray alloc] init];
        countries = [[NSArray alloc] init];
        
        checkboxes = [[NSArray alloc] init];
        
        
    }
    return self;
}

- (void) buildForm {
    
    //get the form elements
    NSArray* formElements = [formData objectForKey:@"Form Elements"];
    
    //set some props
    float formElementX1 = 5.0;
    float formElementX2 = 165.0;
    float formElementY = 10.0;
    CGSize labelSize;
    float maxLabelWidth = 0.0;
    
    //loop through the elements
    for(int fe=0; fe<formElements.count; fe++) {
        
        //increment y (skipping 0 because it contains the form title)
        if (fe>1) {
            formElementY = formElementY + 40.0;
        }
        
        //get the element dictionary
        if (fe > 0) { 
            NSDictionary* thisFormElementData = [formElements objectAtIndex:fe];
            
            //get the element title
            NSString* elementName = [thisFormElementData objectForKey:@"Field Name"];
            
            //get width of label
            labelSize = [elementName sizeWithFont:[UIFont fontWithName:@"Helvetica" size:18.0]];
            
            //increase maxLabelWidth if needed
            if (labelSize.width > maxLabelWidth) {
                maxLabelWidth = labelSize.width;
            }
            
            //build the element label
            OAI_FormLabel* thisFormLabel = [[OAI_FormLabel alloc] initWithFrame:CGRectMake(formElementX1, formElementY, labelSize.width, 30.0)];
            thisFormLabel.text = elementName;
            
            //add label to the formview
            [self addSubview:thisFormLabel];

            //get the element type
            NSString* elementType = [thisFormElementData objectForKey:@"Field Type"];
            
            //if element == multicheckbox get the checkbox data
            checkboxes = [thisFormElementData objectForKey:@"Checkboxes"];
            
            //get required status
            bool isRequired = [thisFormElementData objectForKey:@"isRequired"];
            
            bool isContact = [thisFormElementData objectForKey:@"isContact"];
                        
            //get the element width
            NSString* elementWidth = [thisFormElementData objectForKey:@"Field Size"];
            
            //add some extra padding to top of table
            if ([elementType isEqualToString:@"Table"]) {
                formElementY = formElementY + 20.0;
            }
            
            //add extra padding to top of element if previous element was a table
            if (fe >1) {
                NSDictionary* previousElement = [formElements objectAtIndex:fe-1];
                if([[previousElement objectForKey:@"Field Type"] isEqualToString:@"Table"]) {
                   formElementY = formElementY + 70.0;
                }
            }
            
            [self buildFormElement:elementName :elementType :thisFormLabel :elementWidth :maxLabelWidth :labelSize :formElementX2 :formElementY :isRequired : isContact];
                        
        }
    }
}

- (void) buildFormElement : (NSString* ) elementName : (NSString* ) elementType : (OAI_FormLabel*) thisFormLabel : (NSString* ) elementWidth : (float) maxLabelWidth : (CGSize) labelSize : (float) formElementX2 : (float) formElementY : (bool) isRequired : (bool) isContact {
    
    if([elementType isEqualToString:@"Section"]) {
        
        //reset the section to a blue background
        thisFormLabel.backgroundColor = [colorManager setColor:08.0:25.0:102.0];
        
        //reset font to white
        thisFormLabel.textColor = [UIColor whiteColor];
        
        //let the class know it needs insets
        thisFormLabel.hasInset = YES;
        
        //reset width to full width of form
        CGRect sectionFrame = thisFormLabel.frame;
        sectionFrame.size.width = self.frame.size.width-10.0;
        thisFormLabel.frame = sectionFrame;
        
        /*
        //see if it needs a button
        bool hasButton = [thisFormElement objectAtIndex:5];
        
        if (hasButton) {
            
            UIButton* addHospitalRoom = [UIButton buttonWithType:UIButtonTypeContactAdd];
            
            //get frame
            CGRect addHospRoomFrame = addHospitalRoom.frame;
            
            addHospRoomFrame.origin.x = thisFormLabel.frame.size.width - (addHospRoomFrame.size.width + 10.0);
            addHospRoomFrame.origin.y = thisFormLabel.frame.origin.y;
            
            addHospitalRoom.frame = addHospRoomFrame;
            
            [self addSubview:addHospitalRoom];
            
        }*/
        
        
    } else if ([elementType isEqualToString:@"SubSection"]) {
        
        //reset the section to a blue background
        thisFormLabel.backgroundColor = [colorManager setColor:220.0:156.0:50.0];
        
        //reset font to white
        thisFormLabel.textColor = [colorManager setColor:08.0 :25.0 :102.0];
        
        //give the view a border
        thisFormLabel.layer.borderWidth = 1.0;
        thisFormLabel.layer.borderColor = [colorManager setColor:08.0 :25.0 :102.0].CGColor;
        
        //let the class know it needs insets
        thisFormLabel.hasInset = YES;
        
        //reset width to full width of form
        CGRect sectionFrame = thisFormLabel.frame;
        sectionFrame.size.width = self.frame.size.width-10.0;
        thisFormLabel.frame = sectionFrame;
        
    } else if ([elementType isEqualToString:@"Text Field"]) {
                
        //reset the text field size
        float textFieldW;
        if ([elementWidth isEqualToString:@"Width"]) {
            textFieldW = self.frame.size.width-(maxLabelWidth + 100.0);
        } else if ([elementWidth isEqualToString:@"Large"]) {
            textFieldW = 300.0;
        } else if ([elementWidth isEqualToString:@"Medium"]) {
            textFieldW = 200.0;
        } else if ([elementWidth isEqualToString:@"Small"]) {
            textFieldW = 100.0;
        }
        
        //add contact fields 
        if (isContact) {
            
            UIView* contactFields = [[UIView alloc]initWithFrame:CGRectMake(labelSize.width+20.0, formElementY, (textFieldW*2) + 10.0, 30.0)];
            
            OAI_FormTextField* thisTextField = [[OAI_FormTextField alloc] initWithFrame:CGRectMake(0.0, 0.0, textFieldW, 30.0)];
            
            thisTextField.placeholder = @"Phone:";
            thisTextField.isPhone = YES;
            
            
            [contactFields addSubview:thisTextField];
            
            OAI_FormTextField* thisOtherTextField = [[OAI_FormTextField alloc] initWithFrame:CGRectMake(textFieldW+10.0, 0.0, textFieldW, 30.0)];
            
            thisOtherTextField.placeholder = @"Email:";
            thisOtherTextField.isEmail = YES;
            
            [contactFields addSubview:thisOtherTextField];
            
            [self addSubview:contactFields];
            
            
        } else { 
            
            OAI_FormTextField* thisTextField = [[OAI_FormTextField alloc] initWithFrame:CGRectMake(labelSize.width+20.0, formElementY, textFieldW, 30.0)];
            
            //check to see if it is required
            if (isRequired == YES) {
                thisTextField.placeholder = @"Required";
                
                [self addSubview:thisTextField];
            }
        }
        
        
        
        
    } else if ([elementType isEqualToString:@"Checkbox"]) {
        
        OAI_FormCheckbox* thisCheckbox = [[OAI_FormCheckbox alloc] initWithFrame:CGRectMake(labelSize.width + 20.0, formElementY + 5.0, 20.0, 20.0)];
        
        //give the checkbox an id
        thisCheckbox.checkboxName = elementName;
        
        //each checkbox needs a gesture
        UITapGestureRecognizer *checkboxTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleCheckbox:)];
        
        //add the gesture
        [thisCheckbox addGestureRecognizer:checkboxTap];
        
        [self addSubview:thisCheckbox];
        
    } else if ([elementType isEqualToString:@"MultiCheckbox"]) {
        
        //instantiate the checkbox
        OAI_FormMultiCheckbox* checkboxSet = [[OAI_FormMultiCheckbox alloc] init];
        
        //set up a max width holder
        float maxWidth = 0.0;
        float checkboxX = 0.0;
        float checkboxY = formElementY;
                
        //loop
        for(int c=0; c<checkboxes.count; c++) {
            
            //increment x
            if (c>0) {
                checkboxX = checkboxX + maxWidth;
            }
            
            //get title
            NSString* thisCheckBoxTitle = [checkboxes objectAtIndex:c];
            
            //get size of text
            CGSize thisCheckBoxTitleSize = [thisCheckBoxTitle sizeWithFont:[UIFont fontWithName:@"Helvetica" size:18.0]];
            
            //increment maxWidth
            maxWidth = maxWidth + thisCheckBoxTitleSize.width + 5.0;
            
            //add label
            OAI_FormLabel* thisCheckBoxLabel = [[OAI_FormLabel alloc]initWithFrame:CGRectMake(checkboxX, 0,  thisCheckBoxTitleSize.width, 30.0)];
            
            thisCheckBoxLabel.text = thisCheckBoxTitle;
            
            [checkboxSet addSubview:thisCheckBoxLabel];
            
            //add checkbox
            OAI_FormCheckbox* thisCheckBox = [[OAI_FormCheckbox alloc] initWithFrame:CGRectMake(maxWidth, 5.0, 20.0, 20.0)];
            
            //each checkbox needs a gesture
            UITapGestureRecognizer *checkboxTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleCheckbox:)];
            
            //add the gesture
            [thisCheckBox addGestureRecognizer:checkboxTap];
            
            //set id
            thisCheckBox.checkboxName = thisCheckBoxTitle;
            
            [checkboxSet addSubview:thisCheckBox];
            
            //increment maxWidth
            maxWidth = maxWidth + thisCheckBox.frame.size.width + 20.0;
         
        }
        
        
        //reset the checkboxset frame
        CGRect checkboxSetFrame = checkboxSet.frame;
        checkboxSetFrame.origin.x = labelSize.width + 20.0;
        checkboxSetFrame.origin.y = thisFormLabel.frame.origin.y;
        checkboxSetFrame.size.width = maxWidth;
        checkboxSetFrame.size.height = 30.0;
        checkboxSet.frame = checkboxSetFrame;
        
        [self addSubview:checkboxSet];
         
        
    } else if ([elementType isEqualToString:@"Table"]) {
        
        //instantiate the standard objects
        statesManager = [[OAI_States alloc] init];
        countriesManager = [[OAI_Countries alloc]init];
        
        //insta
        states = [statesManager getStates];
        countries = [countriesManager getCountries];
        
        
        //check to see if it is a standard table
        if([elementName isEqualToString:@"State:"]) {
            
            //init a table
            UITableView* tblStates = [[UITableView alloc] initWithFrame:CGRectMake(labelSize.width+20.0, formElementY,300.0, 94.0) style:UITableViewStylePlain];
            
            tblStates.delegate = self;
            tblStates.dataSource = self;
            
            //set the row height
            tblStates.rowHeight = 30.0;
            
            //give it a border
            tblStates.layer.borderWidth = 1.0;
            
            tblStates.layer.cornerRadius = 2.0;
            
            //tag it
            tblStates.tag = 501;
            
            //display it
            [self addSubview:tblStates];
        }
    }
    
    //fix the x location of all the elements
    NSArray* formElements = self.subviews;
    for(UIView* thisFormElement in formElements) {
        
        
        //reset the x position of all the elements (it's all the same but I am distinguishing class just for future stuff that might need it
        if([thisFormElement isMemberOfClass:[OAI_FormTextField class]]) {
            
            CGRect thisFormElementFrame = thisFormElement.frame;
            thisFormElementFrame.origin.x = maxLabelWidth + 20.0;
            thisFormElement.frame = thisFormElementFrame;
            
        } else if ([thisFormElement isMemberOfClass:[OAI_FormMultiCheckbox class]]){
            
            CGRect thisFormElementFrame = thisFormElement.frame;
            thisFormElementFrame.origin.x = maxLabelWidth + 20.0;
            thisFormElement.frame = thisFormElementFrame;
            
        } else if ([thisFormElement isMemberOfClass:[UITableView class]]) {
            
            CGRect thisFormElementFrame = thisFormElement.frame;
            thisFormElementFrame.origin.x = maxLabelWidth + 20.0;
            thisFormElement.frame = thisFormElementFrame;
            
        } else if ([thisFormElement isMemberOfClass:[UIView class]]) {
            
            CGRect thisFormElementFrame = thisFormElement.frame;
            thisFormElementFrame.origin.x = maxLabelWidth + 20.0;
            thisFormElement.frame = thisFormElementFrame;
        }
    }

}

- (void) toggleCheckbox : (UITapGestureRecognizer* ) recognizer {
    
    //cast the recognizer view to our custom view
    OAI_FormCheckbox* thisCheckbox = (OAI_FormCheckbox*)recognizer.view;
    
    //get its subviews
    NSArray* checkboxSubviews = thisCheckbox.subviews;
    
    //show or hide the checkbox
    if (checkboxSubviews.count > 0) {
        [thisCheckbox hideCheck];
    } else {
        [thisCheckbox showCheck];
    }
    
}

#pragma mark Table Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    if(tableView.tag == 501) {
        return states.count;
    }
    
    return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //this gives each cell a unique identifier and should prevent element overwriting error
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell %d,  %d", indexPath.row, indexPath.section]; //this is where each cell gets  uniquie identifier which prevents any problems
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //set the background color
     if  ([indexPath row] % 2)
        [cell setBackgroundColor:[UIColor whiteColor]];
    else
        [cell setBackgroundColor:[colorManager setColor:188 :193 :255]];
    
    
    // Configure the cell...
    UILabel* cellText = [[UILabel alloc] initWithFrame:CGRectMake(5.0, 5.0, 290.0, 20.0)];
    cellText.font = [UIFont fontWithName:@"Helvetica" size:18.0];
    cellText.textColor = [UIColor blackColor];
    
    if(tableView.tag == 501) {
        cellText.text = [states objectAtIndex:indexPath.row];
    }
    
    cellText.backgroundColor = [UIColor clearColor];
    
    [cell addSubview:cellText];
    
    return cell;
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
