//
//  HanJuViewController.m
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/4/18.
//  Copyright © 2018年 蔡荣辉. All rights reserved.
//

#import "HanJuViewController.h"
#import "HJCollectionViewCell.h"

NSString *const hj_cellID = @"HJ_CellID";

@interface HanJuViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *hj_collectionView;
@property (nonatomic, strong) HJCollectionViewCell *hjCell;

@end

@implementation HanJuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    UICollectionViewFlowLayout *customLayout = [[UICollectionViewFlowLayout alloc] init];
    // scroll 滚动方向
    customLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // 设置行与行之间的间距最小距离
    customLayout.minimumLineSpacing = 10;
    // 设置列与列之间的间距最小距离
    customLayout.minimumInteritemSpacing = 10;
    // 这个属性可以设置分区的偏移量
    customLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    // 设置每个item的大小
    customLayout.itemSize = CGSizeMake(110, 160);

    _hj_collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:customLayout];
    _hj_collectionView.dataSource = self;
    _hj_collectionView.delegate = self;
    [self.view addSubview:_hj_collectionView];
    [_hj_collectionView registerClass:[HJCollectionViewCell class] forCellWithReuseIdentifier:hj_cellID];
}

#pragma mark- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 60;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    _hjCell = [collectionView dequeueReusableCellWithReuseIdentifier:hj_cellID forIndexPath:indexPath];
    _hjCell.backgroundColor = [UIColor redColor];
    _hjCell.layer.cornerRadius = 5;
    _hjCell.layer.masksToBounds = YES;
    return _hjCell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
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
