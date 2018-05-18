//
//  RHMenuItem.m
//  RHVideo
//
//  Created by lipsCai on 2018/4/24.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import "RHMenuItem.h"

static int lineHeight = 2;
static int titleLabelTag = 1009;

@interface RHMenuItem ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *titlesArr;
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic) CGFloat labelWidth;
@property (nonatomic, strong) UILabel *tempLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, getter=isLabelTap) BOOL labelTap;

@end

@implementation RHMenuItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, frame.origin.y, [UIScreen mainScreen].bounds.size.width, frame.size.height);
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews {
    [self reloadData];
}

- (void)setupUI {
    UIScrollView *titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    titleScrollView.showsVerticalScrollIndicator = NO;
    titleScrollView.showsHorizontalScrollIndicator = NO;
    titleScrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:titleScrollView];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, titleScrollView.frame.size.height, [UIScreen mainScreen].bounds.size.width, 0.3)];
    lineView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];
    [self addSubview:lineView];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, titleScrollView.frame.size.height, self.frame.size.width, self.frame.size.height - titleScrollView.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * self.titlesArr.count, 0);
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.alwaysBounceVertical = YES; // 水平回弹
    self.scrollView.alwaysBounceHorizontal = NO; // 垂直回弹
    self.scrollView.directionalLockEnabled = YES;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    for (int i = 0; i < self.titlesArr.count; i++) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(i * self.labelWidth, 0, self.labelWidth, titleScrollView.frame.size.height - lineHeight)];
        _titleLabel.text = self.titlesArr[i];
        if (i == 0) {
             _titleLabel.textColor = [UIColor magentaColor];
            _tempLabel = _titleLabel;
            [self didSelect:0];
        }
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.userInteractionEnabled = YES;
        _titleLabel.tag = i + titleLabelTag;
        [titleScrollView addSubview:_titleLabel];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap:)];
        [_titleLabel addGestureRecognizer:tap];
    }
    
    _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, titleScrollView.frame.size.height - lineHeight , self.labelWidth - 50, lineHeight)];
    _lineView.backgroundColor = [UIColor magentaColor];
    [titleScrollView addSubview:_lineView];
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.transform =  CGAffineTransformMakeTranslation(25, 0);
    }];
}

- (void)reloadData {
    [self removeAllViews];
    [self setupUI];
}

- (void)removeAllViews {
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
}

#pragma mark - UITapGestureRecognizer
- (void)labelTap:(UITapGestureRecognizer *)tap {
    UILabel *tapView = (UILabel *)tap.view;
    if (tapView.tag == self.tempLabel.tag) {
        return;
    }
    NSInteger tag = tap.view.tag - titleLabelTag;
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.transform = CGAffineTransformMakeTranslation(self.labelWidth * tag + 25, 0);
    } completion:^(BOOL finished) {
        self.labelTap = YES;
        self.tempLabel.textColor = [UIColor blackColor];
        tapView.textColor = [UIColor magentaColor];
        self.tempLabel = tapView;
        [self.scrollView setContentOffset:CGPointMake(self.frame.size.width * tag, 0) animated:YES];
        [self didSelect:tag];
    }];
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.isLabelTap) {
        return;
    }
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    if (contentOffsetX < 0) {
        contentOffsetX = 0;
    }
    if (contentOffsetX > scrollView.contentSize.width - self.frame.size.width) {
        contentOffsetX = scrollView.contentSize.width - self.frame.size.width;
    }
    CGFloat rate = contentOffsetX / self.frame.size.width;
    
    rate *= self.labelWidth;
    rate += 25;
    self.lineView.transform = CGAffineTransformMakeTranslation(rate, 0);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.labelTap = NO;
    for (int i = 0; i < self.titlesArr.count; i++) {
        UILabel *tempLabel = [self viewWithTag:i + titleLabelTag];
        tempLabel.userInteractionEnabled = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    for (int i = 0; i < self.titlesArr.count; i++) {
        UILabel *tempLabel = [self viewWithTag:i + titleLabelTag];
        tempLabel.userInteractionEnabled = YES;
    }
    CGFloat rate = scrollView.contentOffset.x / self.frame.size.width;
    if (rate < 0) {
        rate = 0;
    }
    UILabel *selectLabel = [self viewWithTag:rate + titleLabelTag];
    if (self.tempLabel.tag == selectLabel.tag) {
        return;
    }
    
    _tempLabel.textColor = [UIColor blackColor];
    selectLabel.textColor = [UIColor magentaColor];
    _tempLabel = selectLabel;
    [self didSelect:selectLabel.tag - titleLabelTag];
}

- (void)didSelect:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(menuItem:didSelectedItemAtIndex:)]) {
        [self.delegate menuItem:self didSelectedItemAtIndex:index];
    }
}

#pragma mark - GET
- (NSArray *)titlesArr {
    if ([self.dataSource respondsToSelector:@selector(numberOfTitlesInMenuItem:)]) {
        return [self.dataSource numberOfTitlesInMenuItem:self];
    }
    return @[];
}

- (CGFloat)labelWidth {
    return (self.frame.size.width) / self.titlesArr.count;
}

@end
