//
//  ShortForm.h
//  AcronymExpander
//
//  Created by Aneesha on 10/25/15.
//  Copyright © 2015 Aneesha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShortForm : NSObject

@property (nonatomic, strong) NSString *shortForm;
@property (nonatomic, strong) NSArray *longforms;

- (id)initWithJsonData:(NSDictionary *)jsonData;

@end
