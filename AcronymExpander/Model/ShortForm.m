//
//  ShortForm.m
//  AcronymExpander
//
//  Created by Aneesha on 10/25/15.
//  Copyright © 2015 Aneesha. All rights reserved.
//

#import "ShortForm.h"
#import "LongForm.h"

@implementation ShortForm

static NSString* const kShortForm = @"sf";
static NSString* const kLongforms = @"lfs";

- (id)initWithJsonData:(NSDictionary *)jsonData {
    self = [super init];
    if (self) {
        
        if (jsonData[kShortForm] && ![jsonData[kShortForm] isEqual:[NSNull null]]) {
            _shortForm = jsonData[kShortForm];
        }
        if (jsonData[kLongforms] && ![jsonData[kLongforms] isEqual:[NSNull null]]) {
            
            NSMutableArray *longFormList = [[NSMutableArray alloc]initWithCapacity:[jsonData[kLongforms] count]];
            for (NSDictionary *dict in jsonData[kLongforms]) {
                LongForm *longForm = [[LongForm alloc]initWithJsonData:dict];
                [longFormList addObject:longForm];
            }
            _longforms = longFormList;
        }
    }
    return self;
}

@end
