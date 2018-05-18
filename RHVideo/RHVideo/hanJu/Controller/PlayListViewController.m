//
//  PlayListViewController.m
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/5/9.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import "PlayListViewController.h"

NSString *cellID = @"PlayListCell";

@interface PlayListViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *listCollectionView;

@end

@implementation PlayListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(60, 40);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 6, 10);
    _listCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    _listCollectionView.backgroundColor = [UIColor whiteColor];
    _listCollectionView.showsVerticalScrollIndicator = NO;
    _listCollectionView.showsHorizontalScrollIndicator = NO;
    _listCollectionView.dataSource = self;
    _listCollectionView.delegate = self;
//   _listCollectionView.bounces = YES;
    [_listCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    [self.view addSubview:_listCollectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 16;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
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
