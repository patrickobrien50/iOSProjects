//
//  AppDelegate.h
//  Practice Project
//
//  Created by Patrick O'Brien on 5/2/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

