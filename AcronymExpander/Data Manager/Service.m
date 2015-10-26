//
//  Service.m
//  AcronymExpander
//
//  Created by Aneesha on 10/25/15.
//  Copyright © 2015 Aneesha. All rights reserved.
//

#import "Service.h"
#import <AFHTTPRequestOperationManager.h>
#import "Constants.h"
#import "ShortForm.h"

@implementation Service


+ (Service *)sharedManager {
    
    static Service *_instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance = [[Service alloc] init];
    });
    return _instance;
}


- (void)fetchListOfAbbrevationsForShortForm:(NSString *)sf withCompletionBlock:(void(^)(NSArray *abbrevList, NSError *error))block {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    AFJSONResponseSerializer *jsonResponseSerializer = [AFJSONResponseSerializer serializer];
    NSMutableSet *jsonAcceptableContentTypes = [NSMutableSet setWithSet:jsonResponseSerializer.acceptableContentTypes];
    [jsonAcceptableContentTypes addObject:@"text/plain"];
    jsonResponseSerializer.acceptableContentTypes = jsonAcceptableContentTypes;
    manager.responseSerializer = jsonResponseSerializer;
    
    NSString *urlForGet =  [NSString stringWithFormat:kNactemAcronymUrl, sf];
    
    [manager GET:urlForGet parameters:nil success:^(AFHTTPRequestOperation *  operation, id  responseObject) {
        if (responseObject) {
            
            NSArray *shortforms = responseObject;
            ShortForm *shortform;
            
            if (shortforms.count > 0) {
                shortform = [[ShortForm alloc]initWithJsonData:[shortforms firstObject]];
                block(shortform.longforms, nil);
            }
            else {
                block(nil, nil);
            }
        }
    } failure:^(AFHTTPRequestOperation *  operation, NSError *  error) {
        block (nil, error);
    }];
}
@end
