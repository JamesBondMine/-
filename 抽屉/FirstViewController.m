//
//  FirstViewController.m
//  抽屉
//
//  Created by hipiao on 2017/12/13.
//  Copyright © 2017年 com.James.Project. All rights reserved.
//

#import "FirstViewController.h"
#import "JSCTViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"First";
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIBarButtonItem * menuItem = [[UIBarButtonItem alloc]initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(openCloseMenu:)];
    self.navigationItem.leftBarButtonItem = menuItem;
    
}
-(void)openCloseMenu:(UIBarButtonItem *)sender{
    [self.navigationController.parentViewController performSelector:@selector(openCloseMenu)];
    
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
