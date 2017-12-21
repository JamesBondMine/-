//
//  JSMenuViewController.h
//  抽屉
//
//  Created by hipiao on 2017/12/13.
//  Copyright © 2017年 com.James.Project. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MenuControllerDelgete <NSObject>

-(void)menuController:(UIViewController *)controller selectItemTag:(NSInteger)index;

@end

@interface JSMenuViewController : UIViewController

@property (nonatomic , weak) id <MenuControllerDelgete> degete;

@end
