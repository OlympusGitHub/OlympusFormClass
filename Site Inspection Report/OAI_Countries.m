//
//  Countries.m
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/17/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import "OAI_Countries.h"

@implementation OAI_Countries

@synthesize countries;

- (NSArray* ) getCountries {
    
    NSMutableArray* countryList = [NSMutableArray arrayWithCapacity: [[NSLocale ISOCountryCodes] count]];
    
    for (NSString *countryCode in [NSLocale ISOCountryCodes]) {
        
        NSString *identifier = [NSLocale localeIdentifierFromComponents: [NSDictionary dictionaryWithObject: countryCode forKey: NSLocaleCountryCode]];
        NSString *country = [[NSLocale currentLocale] displayNameForKey: NSLocaleIdentifier value: identifier];
        [countryList addObject: country];
    }

    countries = [countryList sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    return countries;

}

@end
