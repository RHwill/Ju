//
//  HanJuViewController.m
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/4/18.
//  Copyright © 2018年 蔡荣辉. All rights reserved.
//

#import "HanJuViewController.h"
#import "HJCollectionViewCell.h"
#import "HanJuVM.h"
#import "UIView+RH.h"
#import <MJRefresh.h>
#import <MBProgressHUD.h>

NSString *const hj_cellID = @"HJ_CellID";

@interface HanJuViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *hj_collectionView;
@property (nonatomic, strong) HJCollectionViewCell *hjCell;
@property (nonatomic, strong) NSMutableArray *collectionData;
@property (nonatomic, strong) HanJuVM *hj_vm;

@end

@implementation HanJuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupUI];
}

- (void)setupUI {
    UICollectionViewFlowLayout *customLayout = [[UICollectionViewFlowLayout alloc] init];
    // scroll 滚动方向
//    customLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // 设置行与行之间的间距最小距离
//    customLayout.minimumLineSpacing = 10;
    // 设置列与列之间的间距最小距离
//    customLayout.minimumInteritemSpacing = 5;
    // 这个属性可以设置分区的偏移量
    customLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    // 设置每个item的大小
    customLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 3.0 - 15.0, [UIScreen mainScreen].bounds.size.height / 3.0 - self.tabBarController.tabBar.frame.size.height);

    _hj_collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:customLayout];
    _hj_collectionView.backgroundColor = [UIColor whiteColor];
    _hj_collectionView.dataSource = self;
    _hj_collectionView.delegate = self;
    _hj_collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 马上进入刷新状态
        [self.hj_collectionView.mj_header beginRefreshing];
        [self setupData];
    }];
    _hj_collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [self.view addSubview:_hj_collectionView];
    [_hj_collectionView registerClass:[HJCollectionViewCell class] forCellWithReuseIdentifier:hj_cellID];
}

- (void)loadMoreData {
    [self.hj_vm hj_loadMoreDataSource:^(NSArray *dataSource) {
        [self.hj_collectionView.mj_footer endRefreshing];
        if (dataSource.count > 0) {
            [self.collectionData addObjectsFromArray:dataSource];
            [self.hj_collectionView reloadData];
            self.hj_collectionView.mj_footer.hidden = YES;
            return;
        }
        // 错误处理
        [self.view rh_showText:@"获取数据失败"];
        return;
    } error:^(NSError *error) {
        [self.view rh_showText:error.localizedDescription];
        [self.hj_collectionView.mj_footer endRefreshing];
    }];
}

- (void)setupData {
    [self.hj_vm hj_loadDataSource:^(NSArray *dataSource) {
        [self.hj_collectionView.mj_header endRefreshing];
        if (dataSource.count > 0) {
            self.collectionData = dataSource.mutableCopy;
            [self.hj_collectionView reloadData];
            self.hj_collectionView.mj_footer.hidden = NO;
            return;
        }
        // 错误处理；
        [self.view rh_showText:@"获取数据失败"];
        return;
    } error:^(NSError *error) {
        [self.view rh_showText:error.localizedDescription];
        [self.hj_collectionView.mj_header endRefreshing];
    }];
}

#pragma mark- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionData.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    _hjCell = [collectionView dequeueReusableCellWithReuseIdentifier:hj_cellID forIndexPath:indexPath];
    [_hjCell setModel:self.collectionData[indexPath.row]];
    return _hjCell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelect %ld", (long)indexPath.row);
    [self.view rh_showText:[NSString stringWithFormat:@"点击了%ld",(long)indexPath.row]];
}

#pragma mark - GET
- (NSMutableArray *)collectionData {
    if (!_collectionData) {
        _collectionData = [NSMutableArray array];
    }
    return _collectionData;
}

- (HanJuVM *)hj_vm {
    if (!_hj_vm) {
        _hj_vm = [[HanJuVM alloc] init];
    }
    return _hj_vm;
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
