//
//  MainTabBarViewController.m
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/4/18.
//  Copyright © 2018年 蔡荣辉. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MainNavViewController.h"
#import "HanJuViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [UITabBar appearance].barTintColor = [UIColor blueColor];
    [UITabBar appearance].tintColor = [UIColor whiteColor];
    [self addChildViewControllers];
    
}

- (void)addChildViewControllers {
    [self setChildViewController:[[HanJuViewController alloc] init] title:@"韩剧" imageName:@""];
}

- (void)setChildViewController:(UIViewController *)viewcontrollr title:(NSString *)title imageName:(NSString *)imageName {
    
    viewcontrollr.title = title;
    viewcontrollr.tabBarItem.image = [UIImage imageNamed:imageName];
    MainNavViewController *navVC = [[MainNavViewController alloc] initWithRootViewController:viewcontrollr];
    [self addChildViewController:navVC];
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
