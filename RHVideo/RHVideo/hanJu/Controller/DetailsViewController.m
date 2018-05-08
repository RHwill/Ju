//
//  DetailsViewController.m
//  RHVideo
//
//  Created by lipsCai on 2018/4/23.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import "DetailsViewController.h"
#import "DetailsHeaderView.h"
#import "RHMenuItem.h"

@interface DetailsViewController ()<UITableViewDataSource, UITableViewDelegate, RHMenuItemDataSoucre, RHMenuItemDelegate>

@property (nonatomic, strong) UITableView *deatilsTableView;
@property (nonatomic, strong) UIScrollView *detailsScrollView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.model.name;
    
//    [self.view addSubview:self.deatilsTableView];
    [self setupViews];
}

- (void)setupViews {
    self.navigationController.navigationBar.translucent = NO;
    // 滚动view
    self.detailsScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.detailsScrollView.showsVerticalScrollIndicator = NO;
    self.detailsScrollView.showsHorizontalScrollIndicator = NO;
    self.detailsScrollView.delegate = self;
    [self.view addSubview:self.detailsScrollView];
    
    // 头部view
    DetailsHeaderView *headerView = [[DetailsHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180) model:self.model];
    [self.detailsScrollView addSubview:headerView];
    
    
    RHMenuItem *rh = [[RHMenuItem alloc] initWithFrame:CGRectMake(0, 0, 200, 400)];
    rh.dataSource = self;
    rh.delegate = self;
//    [self.view addSubview:rh];
}

- (NSArray *)numberOfTitlesInMenuItem:(RHMenuItem *)menu {
    return @[@"剧集", @"详情", @"讨论区"];
}

- (void)menuItem:(RHMenuItem *)menu didSelectedItemAtIndex:(NSInteger)index {
//    QingViewController *qing = [[QingViewController alloc] init];
//    [self addChildViewController:qing];
//    [menu.scrollView addSubview:qing.view];
//    [qing didMoveToParentViewController:self];
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
