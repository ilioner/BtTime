//
//  BTTIMESettingViewController.m
//  BtTime
//
//  Created by zql on 14-2-26.
//  Copyright (c) 2014年 zql. All rights reserved.
//

#import "BTTIMESettingViewController.h"

@interface BTTIMESettingViewController ()

@end

@implementation BTTIMESettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Setting";
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStyleBordered target:self action:@selector(shareMsg:)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)shareMsg:(id)sender
{
    
}
@end
