//
//  DetailsViewController.m
//  RHVideo
//
//  Created by lipsCai on 2018/4/23.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *deatilsTableView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.model.name;
    
    [self.view addSubview:self.deatilsTableView];
}

- (UITableView *)deatilsTableView {
    if (!_deatilsTableView) {
        _deatilsTableView = [[UITableView alloc] initWithFrame:self.view.frame];
        _deatilsTableView.dataSource = self;
        _deatilsTableView.delegate = self;
        [_deatilsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"defCell"];
    }
    return _deatilsTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"defCell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 160;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self headerView];
}

- (UIView *)headerView {
    UIView *hView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 160)];
    hView.backgroundColor = [UIColor redColor];
    return hView;
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

@end
