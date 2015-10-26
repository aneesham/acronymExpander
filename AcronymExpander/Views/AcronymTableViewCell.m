//
//  AcronymTableViewCell.m
//  AcronymExpander
//
//  Created by Aneesha on 10/26/15.
//  Copyright © 2015 Aneesha. All rights reserved.
//

#import "AcronymTableViewCell.h"
#import "LongForm.h"

@interface AcronymTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *primaryLabel;
@property (nonatomic, weak) IBOutlet UILabel *originLabel;
@property (nonatomic, weak) IBOutlet UILabel *frequencyLabel;


@end


@implementation AcronymTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)configureCellWith:(LongForm *)longForm {
    
    self.primaryLabel.text = longForm.name.length?longForm.name:@"";
    
    NSString *frequencyStr = [NSString stringWithFormat:@"%@%@", longForm.frequency?@"Frequency ":@"", longForm.frequency?longForm.frequency:@""];
    
    NSString *originStr = [NSString stringWithFormat:@"%@%@", longForm.yearOfOrigin?@"Since ":@"", longForm.yearOfOrigin?longForm.yearOfOrigin:@""];
    
    self.originLabel.text = originStr;
    self.frequencyLabel.text = frequencyStr;
}
@end
