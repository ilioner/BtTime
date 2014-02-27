//
//  BTTIMEViewController.m
//  BtTime
//
//  Created by zql on 14-2-25.
//  Copyright (c) 2014年 zql. All rights reserved.
//

#import "BTTIMEViewController.h"
#import "BTTIMESettingViewController.h"
@interface BTTIMEViewController ()
{
    NSTimer *timer;
}
@end

@implementation BTTIMEViewController

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
    cus_navibar.frame = CGRectMake(0, 0, 320, 44);
    
//    [self.n addSubview:cus_navibar];
//    [self.navigationItem bringSubviewToFront:cus_navibar];
    cus_navibar.hidden = NO;
    _dataAry = [[NSMutableArray alloc] init];
    [self getdata];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    UIView *view = [self.navigationController.navigationBar viewWithTag:100];
    [view removeFromSuperview];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIView *view = [self.navigationController.navigationBar viewWithTag:100];
    [view removeFromSuperview];
    cus_navibar.tag = 100;
    [self.navigationController.navigationBar addSubview:cus_navibar];
}
- (void)getdata
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    NSURL *url = [NSURL URLWithString:@"http://api.btc38.com/v1/ticker.php?c=all"];
    //    [loginWebView loadRequest:[NSURLRequest requestWithURL:url]];
    //    loginWebView.delegate = self;
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"___%@",JSON);
        [timer invalidate];
        timer =  [NSTimer scheduledTimerWithTimeInterval:300.0f target:self selector:@selector(getdata) userInfo:nil repeats:YES];
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        [_dataAry removeAllObjects];
        [self parseData:JSON];
        mainTableView.delegate = self;
        mainTableView.dataSource = self;
        [mainTableView reloadData];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"_error__%@",JSON);
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
    }];
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    
}

#pragma mark UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strIden = @"cellBt";
    BTTIMECell *cell = (BTTIMECell *)[tableView dequeueReusableCellWithIdentifier:strIden];
    if (!cell) {
        cell = [[BTTIMECell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strIden];
    }
    cell.backgroundColor = [UIColor clearColor];
    BTTIMECoin *coin = [_dataAry objectAtIndex:indexPath.row];
    cell.name.text = coin.name;
    cell.buy.text = [NSString stringWithFormat:@"%@",coin.buy];
    cell.sell.text = [NSString stringWithFormat:@"%@",coin.sell];
    cell.high.text = [NSString stringWithFormat:@"%@",coin.high];
    cell.low.text = [NSString stringWithFormat:@"%@",coin.low];
    if ([coin.name isEqualToString:@"unc"]) {
        cell.backgroundColor = [UIColor purpleColor];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataAry count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark parseData
- (void)parseData:(id)Json
{
    NSMutableDictionary *dic = (NSMutableDictionary *)Json;
    NSLog(@"dic is ----%@",dic);
    NSMutableArray *nameAry = (NSMutableArray *)[dic allKeys];
    for (int i = 0; i<nameAry.count; i++) {
        NSMutableDictionary *subDic = [dic objectForKey:[nameAry objectAtIndex:i]];
        BTTIMECoin *coin = [[BTTIMECoin alloc] init];
        coin.name = [nameAry objectAtIndex:i];
        coin.buy = [subDic objectForKey:@"buy"];
        coin.sell = [subDic objectForKey:@"sell"];
        coin.high = [subDic objectForKey:@"high"];
        coin.low = [subDic objectForKey:@"low"];
        [_dataAry addObject:coin];
    }
    
}
- (IBAction)getNewData:(UIButton *)sender {
    [self getdata];
}
- (IBAction)gotoSafari:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.btc38.com"]];
}

- (IBAction)clickSetting:(UIButton *)sender {
    BTTIMESettingViewController *settingView = [[BTTIMESettingViewController alloc] init];
    [self.navigationController pushViewController:settingView animated:YES];
}
@end
