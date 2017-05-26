//
//  AppDelegate.h
//  photowall
//
//  Created by student on 2017/5/5.
//  Copyright © 2017年 naidy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "UserManager.h"
#import "AccountManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, AuthenticationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UserManager* userManager;
@property (strong, nonatomic) AccountManager* accountManager;

@end

