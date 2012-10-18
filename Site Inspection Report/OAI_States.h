//
//  OAI_States.h
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/17/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAI_States : NSObject {
    
    NSArray* states;
    NSDictionary* statesAndAbbrevs;
    
}

- (NSArray* ) getStates;

- (NSDictionary* ) getStatesAndAbbreviations;

@end

