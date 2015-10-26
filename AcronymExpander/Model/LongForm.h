//
//  LongForm.h
//  AcronymExpander
//
//  Created by Aneesha on 10/25/15.
//  Copyright © 2015 Aneesha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LongForm : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *frequency;
@property (nonatomic, strong) NSNumber *yearOfOrigin;

@property (nonatomic, strong) NSArray *variations;

- (id)initWithJsonData:(NSDictionary *)jsonData;

@end
