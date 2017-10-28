//
//  AppDelegate.m
//  PracticaWineApp
//
//  Created by Francisco Payán Calero on 20/10/17.
//  Copyright © 2017 Francisco Payán Calero. All rights reserved.
//

#import "AppDelegate.h"
#import "FPCMainViewController.h"
//
#import "FPCWineViewController.h"
#import "FPCWineModel.h"

#import "FPCWebViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Creamos una UIView
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Creamos un modelo
    FPCWineModel *tintorro = [FPCWineModel initWithName:@"Bembibre"
                                        wineCompanyName:@"Dominio de Tares"
                                                   type:@"Tinto"
                                                 origin:@"El Bierzo"
                                                 grapes:@[@"Mencía"]
                                         wineCompanyWeb:[NSURL URLWithString:@"http://www.dominiodetares.com/index.php/es/vinos/baltos/74-bembibrevinos"]
                                                  notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado."
                                                 rating:5
                                                  photo:[UIImage imageNamed:@"bembibre.jpg"]];
    
    
    // Creamos un modelo
    FPCWineModel *albarinno = [FPCWineModel initWithName:@"Zárate"
                                        wineCompanyName:@"Zárate"
                                                   type:@"White"
                                                 origin:@"Rias Bajas"
                                                 grapes:@[@"Albariño"]
                                         wineCompanyWeb:[NSURL URLWithString:@"http://bodegas-zarate.com/productos/vinos/albarino-zarate/"]
                                                   notes:@"El ZARATE Albariño 2015 es un vino fresco, equilibrado y elegante, su mineralizad y acidez natural son los elementos clave para este equilibrio. Los viñedos ZARATE tienen una media de edad de 35 años.\n La climatología del año 2015: a nivel de temperatura podemos calificarlo como un año cálido. La primavera fue cálida con unas temperaturas ligeramente por encima de los normales destacando asimismo la ausencia de temperaturas bajas, esto provocó un adelanto de la brotación con respecto a campañas anteriores de unas 2 semanas. Junio y Julio también fueron meses cálidos pero agosto y septiembre fueron fríos. En cuanto a precipitaciones fue un año seco con una disminución del 25% por debajo del valor climático esperado, junio y julio fueron muy secos llegando a provocar un fuerte stress hídrico en la planta. El cambio llegó en Agosto y septiembre que resultaron muy húmedos."
                                                 rating:4
                                                  photo:[UIImage imageNamed:@"zarate.jpg"]];
    
    // Creamos un modelo
    FPCWineModel *champagne = [FPCWineModel initWithName:@"Contes de Champagne"
                                        wineCompanyName:@"Champagne Taittinger"
                                                   type:@"Other"
                                                 origin:@"Champagne"
                                                 grapes:@[@"Chardonnay"]
                                         wineCompanyWeb:[NSURL URLWithString:@"http://www.taittinger.fr"]
                                                  notes:@"Es un vino con una frescura extraordinaria, aromas a frutas rojas como fresas, frambuesas o grosellas, es un vino ligero y muy bien equilibrado con una acidez extraordinaria.\n Pruébalo con sushi, ostras o marisco, pero fundamentalmente le va bien al salmón a la plancha o ahumado y al caviar!"
                                                 rating:5
                                                  photo:[UIImage imageNamed:@"champagne.jpg"]];
    
    
    
    
    // Creamos la vista que maneja la interfaz de usuario.
    // FPCMainViewController *mainVC = [FPCMainViewController new];
    
    // Controller one in UITabBarController.
    FPCWineViewController *wineTintoVC = [[FPCWineViewController alloc] initWithModel:tintorro];
    FPCWineViewController *wineAlbarinnoVC = [[FPCWineViewController alloc] initWithModel:albarinno];
    FPCWineViewController *wineChampagneVC = [[FPCWineViewController alloc] initWithModel:champagne];
    
    // Controller two in UITabBarController.
    //FPCWebViewController *webWineVC = [[FPCWebViewController alloc] initWithModel:tintorro];
    
    /* Combinador example one
    // Create the combinador UITabBarController
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    // add at UITabBarController
    tabBarVC.viewControllers = @[wineVC, webWineVC];
    */
    
    
    // Create the combinador UITabBarController
    UINavigationController *navTintoVC = [[UINavigationController alloc] initWithRootViewController:wineTintoVC];
    UINavigationController *navAlbarinnoVC = [[UINavigationController alloc] initWithRootViewController:wineAlbarinnoVC];
    UINavigationController *navChampageVC = [[UINavigationController alloc] initWithRootViewController:wineChampagneVC];
   
    // Create the combinador
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[navTintoVC, navAlbarinnoVC, navChampageVC];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tabVC;
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
