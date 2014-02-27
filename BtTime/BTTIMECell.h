//
//  BTTIMECell.h
//  BtTime
//
//  Created by zql on 14-2-25.
//  Copyright (c) 2014年 zql. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTTIMECell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *buy;
@property (strong, nonatomic) IBOutlet UILabel *sell;
@property (strong, nonatomic) IBOutlet UILabel *high;
@property (strong, nonatomic) IBOutlet UILabel *low;

@end
