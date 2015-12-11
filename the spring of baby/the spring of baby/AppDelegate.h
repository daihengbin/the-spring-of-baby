//
//  AppDelegate.h
//  the spring of baby
//
//  Created by 代恒彬 on 15/12/3.
//  Copyright © 2015年 代恒彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDMenuController.h"
#import "RootViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)DDMenuController*menuController;
@property(strong,nonatomic)RootViewController *rootController;
@end

