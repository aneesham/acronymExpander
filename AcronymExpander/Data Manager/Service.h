//
//  Service.h
//  AcronymExpander
//
//  Created by Aneesha on 10/25/15.
//  Copyright © 2015 Aneesha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Service : NSObject

+ (Service *)sharedManager;

- (void)fetchListOfAbbrevationsForShortForm:(NSString *)shortForm withCompletionBlock:(void(^)(NSArray *abbrevList, NSError *error))block;
@end
