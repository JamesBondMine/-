//
//  JSCTViewController.m
//  抽屉
//
//  Created by hipiao on 2017/12/13.
//  Copyright © 2017年 com.James.Project. All rights reserved.
//

#import "JSCTViewController.h"
#import "JSMenuViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#define JWidth [[UIScreen mainScreen]bounds].size.width
#define JHeight [[UIScreen mainScreen]bounds].size.height


@interface JSCTViewController ()
<
  MenuControllerDelgete
>
@property (nonatomic , strong) JSMenuViewController * menu;
@property (nonatomic , strong) UIViewController * controller;
@property (nonatomic , strong) NSArray * controllerArray;
@property (nonatomic , assign) BOOL isopen;

@property (nonatomic , assign) NSUInteger controllerIndex;
@property (nonatomic , assign , readonly) BOOL isAnimating;

@end

@implementation JSCTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    [self addChildView];
    
    [self addChildViewControllerMotherd];
}
-(void)addChildView{
    
    [self setMenu:[[JSMenuViewController alloc]init]];
    [self addChildViewController:self.menu];
    [self.view addSubview:self.menu.view];

    self.menu.degete = self;
}
-(void)addChildViewControllerMotherd{
    
    FirstViewController * first = [[FirstViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:first];
    SecondViewController * Second = [[SecondViewController alloc]init];
    UINavigationController * nav1 = [[UINavigationController alloc]initWithRootViewController:Second];
    [self setControllerArray:@[nav,nav1]];
    [self setController:nav];
    
}
-(void)setController:(UIViewController *)controller{
    if (_controller == controller) {
        return;
    }
    if (_controller) {
        controller.view.transform = _controller.view.transform;
    }
    [_controller willMoveToParentViewController:nil];
    [_controller.view removeFromSuperview];
    [_controller removeFromParentViewController];
    _controller = controller;
    
    
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    
}
-(void)openCloseMenu{
    if (_isAnimating) {
        return;
    }
    [UIView animateWithDuration:0.35 animations:^{
        if (!_isopen) {
            self.controller.view.transform = CGAffineTransformMakeTranslation(JWidth - 100, 100);
        }else{
            self.controller.view.transform = CGAffineTransformMakeTranslation(0, 0);
        }
    }completion:^(BOOL finish){
        _isopen = !_isopen;
        [self setController:self.controllerArray[self.controllerIndex]];
        if (!_isopen) {
            if (finish) {
                [UIView animateWithDuration:0.2 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    self.controller.view.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finish){
                    _isAnimating = NO;
                }];
            }
        }else{
            _isAnimating = NO;
        }
    }];
}
-(void)menuController:(UIViewController *)controller selectItemTag:(NSInteger)index{
    
    [self setControllerIndex:index];
    [self openCloseMenu];
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
