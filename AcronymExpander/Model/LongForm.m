//
//  LongForm.m
//  AcronymExpander
//
//  Created by Aneesha on 10/25/15.
//  Copyright © 2015 Aneesha. All rights reserved.
//

#import "LongForm.h"

@implementation LongForm

static NSString* const kName = @"lf";
static NSString* const kFrequency = @"freq";
static NSString* const kOriginYear = @"since";
static NSString* const kVariations = @"vars";

- (id)initWithJsonData:(NSDictionary *)jsonData {
    self = [super init];
    if (self) {
        
        if (jsonData[kName] && ![jsonData[kName] isEqual:[NSNull null]]) {
            _name = jsonData[kName];
        }
        if (jsonData[kFrequency] && ![jsonData[kFrequency] isEqual:[NSNull null]]) {
            _frequency = jsonData[kFrequency];
        }
        if (jsonData[kOriginYear] && ![jsonData[kOriginYear] isEqual:[NSNull null]]) {
            _yearOfOrigin = jsonData[kOriginYear];
        }
        if (jsonData[kVariations] && ![jsonData[kVariations] isEqual:[NSNull null]]) {
            
            NSMutableArray *variationList = [[NSMutableArray alloc]initWithCapacity:[jsonData[kVariations] count]];
            for (NSDictionary *dict in jsonData[kVariations]) {
                LongForm *variation = [[LongForm alloc]initWithJsonData:dict];
                [variationList addObject:variation];
            }
            _variations = variationList;
        }
    }
    return self;
}

@end
