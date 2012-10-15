//
//  OAI_ColorManager.h
//  Site Inspection Report
//
//  Created by Steven Suranie on 10/15/12.
//  Copyright (c) 2012 Olympus America. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAI_ColorManager : NSObject

+(OAI_ColorManager* )sharedColorMaker;

- (UIColor* ) setColor : (float) red : (float) green : (float) blue;

@end
