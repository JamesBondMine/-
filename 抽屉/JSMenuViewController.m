//
//  JSMenuViewController.m
//  抽屉
//
//  Created by hipiao on 2017/12/13.
//  Copyright © 2017年 com.James.Project. All rights reserved.
//

#import "JSMenuViewController.h"

@interface JSMenuViewController ()

@end

@implementation JSMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createSubviews];
}
-(void)createSubviews{
    UIImageView *bc = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bc.image = [UIImage imageNamed:@"timg"];
    [self.view addSubview:bc];
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 addTarget:self action:@selector(touchMotherd1:) forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor = [UIColor redColor];
    btn1.frame = CGRectMake(20, 100, 100, 35);
    [self.view addSubview:btn1];
    [btn1 setTitle:@"购票" forState:UIControlStateNormal];
    btn1.tag = 0;
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 addTarget:self action:@selector(touchMotherd1:) forControlEvents:UIControlEventTouchUpInside];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 setTitle:@"影城" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(20, 150, 100, 35);
    [self.view addSubview:btn2];
    btn2.tag = 1;
    
}
-(void)touchMotherd1:(UIButton *)sender{
    
    if ([self.degete respondsToSelector:@selector(menuController:selectItemTag:)]) {
        [self.degete menuController:self selectItemTag:sender.tag];
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
