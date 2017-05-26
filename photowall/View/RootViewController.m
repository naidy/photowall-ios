//
//  RootViewController.m
//  photowall
//
//  Created by Spirit on 4/1/17.
//  Copyright © 2017 Picowork. All rights reserved.
//

#import "RootViewController.h"

#import "FriendsViewController.h"

#import "UIView+Utils.h"
#import "UIColor+Defaults.h"

@implementation RootViewController {
	FriendsViewController* _friendsViewController;

	NSArray* _titles;
	NSArray* _tabButtons;
	NSArray* _viewControllers;

	NSInteger _selectedIndex;
	UIViewController* _currentController;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
	_tabButtons = @[ _friendsTabButton, _gridTabButton, _photoMapTabButton, _profileTabButton ];

	_selectedIndex = 0;

	_friendsViewController = [[FriendsViewController alloc] initWithNibName:@"FriendsListView" bundle:nil];

	_viewControllers = @[ _friendsViewController];

	_friendsViewController.rootViewController = self;
	_friendsViewController.userManager = self.userManager;

	[self setSelectedIndex:0];
	[self setTitle:@"Friends"];
}

#pragma mark - IBActions
- (IBAction)tabButtonPressed:(id)sender {
	if ([sender isKindOfClass:[UIButton class]]) {
		UIButton* button = (UIButton*)sender;
		[self setSelectedIndex:(button.tag - 1)];
	}
}

- (IBAction)takePictureButtonPressed:(id)sender {
	UIImagePickerController* picker = [UIImagePickerController new];
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//	picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	picker.delegate = self;
	[self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - Private Methods
- (void)setSelectedIndex:(NSInteger)index {
	if (index < 0 || index > [_viewControllers count]) {
		return;
	}
	_selectedIndex = index;
	for (NSUInteger i = 0; i < _tabButtons.count; i++) {
		[[_tabButtons objectAtIndex:i] setSelected:(i == index)];
	}
	UIViewController* controller = [_viewControllers objectAtIndex:index];
	if (_currentController == controller) {
		return;
	}
	[_currentController.view removeFromSuperview];
	[self.viewContainer addSubview:controller.view fit:YES];
	_currentController = controller;
}

@end
