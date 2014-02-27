//
//  BTTIMEViewController.h
//  BtTime
//
//  Created by zql on 14-2-25.
//  Copyright (c) 2014年 zql. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTTIMECoin.h"
#import "BTTIMECell.h"
@interface BTTIMEViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *mainTableView;
    NSMutableArray *_dataAry;
    IBOutlet UIView *cus_navibar;
}
- (IBAction)getNewData:(UIButton *)sender;
- (void)getdata;
- (IBAction)gotoSafari:(id)sender;
- (IBAction)clickSetting:(UIButton *)sender;
@end
