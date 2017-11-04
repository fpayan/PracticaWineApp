//
//  AppDelegate.m
//  PracticaWineApp
//
//  Created by Francisco Payán Calero on 20/10/17.
//  Copyright © 2017 Francisco Payán Calero. All rights reserved.
//

#import "AppDelegate.h"
//#import "FPCMainViewController.h"
//
#import "FPCWineViewController.h"
//#import "FPCWineModel.h"

//#import "FPCWebViewController.h"
//
#import "FPCWineryModel.h"
#import "FPCWineryTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Creamos una UIView
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    /* START Para la table view */
    // Creamos un modelo
    FPCWineryModel *modelWinery = [[FPCWineryModel alloc] init];
    
    // Creamos el controlador
    // START SECTION SEVEN
    /*
    FPCWineryTableViewController *wineryVController = [[FPCWineryTableViewController alloc] initWithModel:modelWinery
        style:UITableViewStylePlain];
     
     // Creamos una Navigation
     UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:wineryVController];
     // END Para table view
    */
    // END SECTION SEVEN
    
    /* START SECTION EIGTH */
    // Controladores
    FPCWineryTableViewController *wineryVC = [[FPCWineryTableViewController alloc] initWithModel:modelWinery style:UITableViewStylePlain];
    FPCWineViewController *wineVC = [[FPCWineViewController alloc] initWithModel:[modelWinery redWineAtIndex:0]];
    
    // Combinadores
    UINavigationController *wineNav = [[UINavigationController alloc] initWithRootViewController:wineVC];
    UINavigationController *wineryNav = [[UINavigationController alloc] initWithRootViewController:wineryVC];
    
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    splitVC.viewControllers = @[wineryNav, wineNav];
    splitVC.view.tintColor = [UIColor whiteColor];
    
    // Delegados
    splitVC.delegate = wineVC;
    
    // END SECTION EIGTH
    
    // Creamos la vista que maneja la interfaz de usuario.
    // FPCMainViewController *mainVC = [FPCMainViewController new];
    
    // Controller one in UITabBarController.
    /*
    FPCWineViewController *wineTintoVC = [[FPCWineViewController alloc] initWithModel:tintorro];
    FPCWineViewController *wineAlbarinnoVC = [[FPCWineViewController alloc] initWithModel:albarinno];
    FPCWineViewController *wineChampagneVC = [[FPCWineViewController alloc] initWithModel:champagne];
    */
    
    // Controller two in UITabBarController.
    //FPCWebViewController *webWineVC = [[FPCWebViewController alloc] initWithModel:tintorro];
    
    /* Combinador example one
    // Create the combinador UITabBarController
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    // add at UITabBarController
    tabBarVC.viewControllers = @[wineVC, webWineVC];
    */
    
    
    // Create the combinador UITabBarController
    /*
    UINavigationController *navTintoVC = [[UINavigationController alloc] initWithRootViewController:wineTintoVC];
    UINavigationController *navAlbarinnoVC = [[UINavigationController alloc] initWithRootViewController:wineAlbarinnoVC];
    UINavigationController *navChampageVC = [[UINavigationController alloc] initWithRootViewController:wineChampagneVC];
   */
    // Create the combinador
    /*
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[navTintoVC, navAlbarinnoVC, navChampageVC];
    */
    // Override point for customization after application launch.
    self.window.rootViewController = splitVC ;
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
