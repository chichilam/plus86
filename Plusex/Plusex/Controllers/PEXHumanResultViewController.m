//
//  PEXHumanResultViewController.m
//  Plusex
//
//  Created by rin on 2015/03/29.
//  Copyright (c) 2015年 rin. All rights reserved.
//

#import "PEXHumanResultViewController.h"

@interface PEXHumanResultViewController ()

@property (weak, nonatomic) IBOutlet UITableView *resultTableView;
@end

@implementation PEXHumanResultViewController {
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
    
    dataArr = [NSMutableArray array];
    
    //FIXME dammy data
    for (NSInteger i = 0; i < 3; i++) {
        NSDictionary *dataDic = @{@"name":[NSString stringWithFormat:@"human%ld",(long)i]};
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

@end
