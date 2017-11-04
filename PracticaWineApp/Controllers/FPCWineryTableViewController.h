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

@interface FPCWineryTableViewController : UITableViewController

@property(strong, nonatomic) FPCWineryModel *modelWinery;

-(id) initWithModel:(FPCWineryModel *) aModel style:(UITableViewStyle) aStyle;

@end
