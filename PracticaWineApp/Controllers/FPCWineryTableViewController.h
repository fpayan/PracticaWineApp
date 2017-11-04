//
//  FPCWineryTableViewController.h
//  PracticaWineApp
//
//  Created by Francisco Payán Calero on 3/11/17.
//  Copyright © 2017 Francisco Payán Calero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPCWineryModel.h"


#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2
#define NEW_WINE_NOTIFICATION_NAME @"newWine"
#define WINE_KEY @"wine"

@class FPCWineryTableViewController; // warning here ?

@protocol WineryTableViewControllerDelegate <NSObject>
-(void) wineryTableViewController:(FPCWineryTableViewController *)wineryVC didSelectWine:(FPCWineModel *) aWine;

@end


@interface FPCWineryTableViewController : UITableViewController

@property(strong, nonatomic) FPCWineryModel *modelWinery;
@property(weak, nonatomic) id<WineryTableViewControllerDelegate> idDelegate;

-(id) initWithModel:(FPCWineryModel *) aModel style:(UITableViewStyle) aStyle;

@end



