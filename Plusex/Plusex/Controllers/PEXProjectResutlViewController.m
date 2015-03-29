//
//  PEXProjectResutlViewController.m
//  Plusex
//
//  Created by rin on 2015/03/29.
//  Copyright (c) 2015年 rin. All rights reserved.
//

#import "PEXProjectResutlViewController.h"

@interface PEXProjectResutlViewController ()

@property (weak, nonatomic) IBOutlet UITableView *resultTableView;
@end

@implementation PEXProjectResutlViewController {
    NSMutableArray *dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self fetchData];
    
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - fetch project search result
-(void) fetchData {
    //FIXME dammy data
    
    dataArr = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 3; i++) {
        NSDictionary *dataDic = @{@"name":[NSString stringWithFormat:@"project%ld",(long)i]};
        [dataArr addObject:dataDic];
    }
}

#pragma mark - initial view
-(void) initView {
    self.resultTableView.delegate = self;
    self.resultTableView.dataSource = self;
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dataDic = dataArr[indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = [dataDic objectForKey:@"name"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PEXProjectDetailViewController *viewController = [[PEXProjectDetailViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
