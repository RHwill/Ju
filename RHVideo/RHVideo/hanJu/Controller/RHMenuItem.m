//
//  RHMenuItem.m
//  RHVideo
//
//  Created by lipsCai on 2018/4/24.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import "RHMenuItem.h"

static int lineHeight = 2;

@interface RHMenuItem ()

@property (nonatomic) NSInteger titlesCount;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation RHMenuItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
    }
    return self;
}

- (void)setupUI {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * self.titlesCount, self.scrollView.frame.size.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.scrollView];
    
    CGFloat labelWidth = (self.frame.size.width) / self.titlesCount;
    for (int i = 0; i < self.titlesCount; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i * labelWidth, 0, labelWidth, self.frame.size.height - lineHeight)];
        label.text = @"";
        label.textAlignment = NSTextAlignmentCenter;
        label.userInteractionEnabled = YES;
        [self.scrollView addSubview:label];
    }
    
    _lineView = [[UIView alloc] initWithFrame:CGRectMake(20, self.frame.size.height - lineHeight , labelWidth - 20, lineHeight)];
    _lineView.backgroundColor = [UIColor magentaColor];
    [self addSubview:_lineView];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.delegate respondsToSelector:@selector(menuItem:didSelectedItemAtIndex:)]) {
#warning <#message#>
        NSLog(@"%@", touches.allObjects.lastObject.view);
        [self.delegate menuItem:self didSelectedItemAtIndex:0];
        // 改变line 线位置
        
        
    }
}

- (void)removeAllViews {
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
}

- (void)reloadData {
    [self removeAllViews];
    [self setupUI];
}

#pragma mark - GET
- (NSInteger)titlesCount {
    return [self.dataSource numberOfTitlesInMenuItem:self];
}

@end
