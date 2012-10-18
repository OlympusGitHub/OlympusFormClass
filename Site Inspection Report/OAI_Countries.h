//
//  Countries.h
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/17/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAI_Countries : NSObject {
    
    NSArray* countries;
    
}

@property (nonatomic, retain) NSArray* countries;

- (NSArray* ) getCountries; 

@end
