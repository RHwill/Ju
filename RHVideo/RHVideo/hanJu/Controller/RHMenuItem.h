//
//  RHMenuItem.h
//  RHVideo
//
//  Created by lipsCai on 2018/4/24.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RHMenuItem;
@protocol RHMenuItemDataSoucre <NSObject>

@required
- (NSArray *)numberOfTitlesInMenuItem:(RHMenuItem *)menu;

@end

@protocol RHMenuItemDelegate <NSObject>

- (void)menuItem:(RHMenuItem *)menu didSelectedItemAtIndex:(NSInteger)index;

@end

@interface RHMenuItem : UIView

@property (nonatomic, weak) id <RHMenuItemDataSoucre>dataSource;
@property (nonatomic, weak) id <RHMenuItemDelegate>delegate;

/// 重新加载数据
- (void)reloadData;

@end
