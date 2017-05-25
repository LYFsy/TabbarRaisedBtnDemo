//
//  SYTabBarController.m
//  自定义IUTabBar
//
//  Created by 刘一峰 on 2016/12/18.
//  Copyright © 2016年 刘一峰. All rights reserved.
//

#import "SYTabBarController.h"
#import "firstViewController.h"
#import "secondViewController.h"
#import "thirdViewController.h"
#import "ViewController.h"
#import "SYTabBar.h"
@interface SYTabBarController ()<SYTabBarDelegate,UITabBarDelegate>
@end

@implementation SYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    SYTabBar *tabbar = [[SYTabBar alloc]init];
    tabbar.SYDelegate = self;
    tabbar.delegate = self;
    [self.tabBar addSubview:tabbar];
    [self setValue:tabbar forKey:@"tabBar"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupChildController];
    // Do any additional setup after loading the view.
}

- (void)setupChildController {
    
    ViewController *vc = [[ViewController alloc]init];
    vc.tabBarItem.title = @"VC";
    firstViewController *firstVC = [[firstViewController alloc]init];
    firstVC.tabBarItem.title = @"First";

    secondViewController *secondVC = [[secondViewController alloc]init];
    secondVC.tabBarItem.title = @"Second";
    thirdViewController *thirdVC = [[thirdViewController alloc]init];
    thirdVC.tabBarItem.title = @"Third";
    [self addChildViewController:vc];
    [self addChildViewController:firstVC];
    [self addChildViewController:secondVC];
    [self addChildViewController:thirdVC];
}

- (void)tabBarDidClickPlusButton:(UIButton *)tabBar titleInfo:(UILabel *)titleLabel {
    [tabBar setImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [titleLabel setTextColor:[UIColor blueColor]];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (![item.title isEqualToString:@"新浪"]) {
        [(SYTabBar *)self.tabBar resetPlusBtnStyle];
    }else {
        [super tabBar:tabBar didSelectItem:item];
    }
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
