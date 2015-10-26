//
//  AcronymTableViewCell.h
//  AcronymExpander
//
//  Created by Aneesha on 10/26/15.
//  Copyright © 2015 Aneesha. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LongForm;
@interface AcronymTableViewCell : UITableViewCell

- (void)configureCellWith:(LongForm *)longForm;

@end
