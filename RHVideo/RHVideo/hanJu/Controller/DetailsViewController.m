//
//  DetailsViewController.m
//  RHVideo
//
//  Created by lipsCai on 2018/4/23.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import "DetailsViewController.h"
#import "PlayListViewController.h"
#import "DetailsHeaderView.h"
#import "RHMenuItem.h"

@interface DetailsViewController ()<UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate, RHMenuItemDataSoucre, RHMenuItemDelegate, DetailsHeaderViewDelegate>

@property (nonatomic, strong) UITableView *deatilsTableView;
@property (nonatomic, strong) UIScrollView *detailsScrollView;

@property (nonatomic, strong) UIScrollView *menuScrollview;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.model.name;
    
//    [self.view addSubview:self.deatilsTableView];
    [self setupViews];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    self.menuScrollview.contentOffset = scrollView.contentOffset;
    if (scrollView == self.detailsScrollView) {
        if (self.detailsScrollView.contentOffset.y <= 0) {
            self.detailsScrollView.contentOffset = CGPointMake(0, 0);
            
        }else if (self.detailsScrollView.contentOffset.y >= 180) {
            self.detailsScrollView.contentOffset = CGPointMake(0, 180);
        }
    }
    
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
}

- (void)setupViews {
    self.navigationController.navigationBar.translucent = NO;
    // 滚动view
    self.detailsScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.detailsScrollView.showsVerticalScrollIndicator = NO;
    self.detailsScrollView.showsHorizontalScrollIndicator = NO;
        self.detailsScrollView.delegate = self;
//    self.detailsScrollView.bounces = NO;
    self.detailsScrollView.contentSize = CGSizeMake(0, self.view.frame.size.height + 180);
    [self.view addSubview:self.detailsScrollView];
    
    // 头部view
    DetailsHeaderView *headerView = [[DetailsHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180) model:self.model];
    headerView.delegate = self;
    [self.detailsScrollView addSubview:headerView];
    
    RHMenuItem *menu = [[RHMenuItem alloc] initWithFrame:CGRectMake(0, 180, self.view.frame.size.width, self.view.frame.size.height - 180)];
    menu.dataSource = self;
    menu.delegate = self;
    [self.detailsScrollView addSubview:menu];
}

- (void)detailsHeaderView:(DetailsHeaderView *)headerView didSelectedIndex:(DetailsHeaderViewSelectType)index {
    NSLog(@"%@", @(index));
}

- (NSArray *)numberOfTitlesInMenuItem:(RHMenuItem *)menu {
    return @[@"剧集", @"详情", @"讨论区"];
}

- (void)menuItem:(RHMenuItem *)menu didSelectedItemAtIndex:(NSInteger)index {
    self.menuScrollview = menu.scrollView;
    PlayListViewController *playListVC = [[PlayListViewController alloc] init];
    CGRect newFrame = CGRectMake(index * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    playListVC.view.frame = newFrame;
    [self addChildViewController:playListVC];
    [menu.scrollView addSubview:playListVC.view];
    [playListVC didMoveToParentViewController:self];
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
