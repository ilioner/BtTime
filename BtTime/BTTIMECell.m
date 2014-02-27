//
//  BTTIMECell.m
//  BtTime
//
//  Created by zql on 14-2-25.
//  Copyright (c) 2014年 zql. All rights reserved.
//

#import "BTTIMECell.h"

@implementation BTTIMECell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self = [[[NSBundle mainBundle] loadNibNamed:@"BTTIMECell" owner:self options:nil] objectAtIndex:0];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
