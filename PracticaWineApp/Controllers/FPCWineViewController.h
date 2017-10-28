//
//  FPCWineViewController.h
//  PracticaWineApp
//
//  Created by Francisco Payán Calero on 21/10/17.
//  Copyright © 2017 Francisco Payán Calero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPCWineModel.h"

@interface FPCWineViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *originLabel;
@property (weak, nonatomic) IBOutlet UILabel *grapesLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingView;


@property (strong, nonatomic) FPCWineModel *modelWine;

-(id) initWithModel: (FPCWineModel *) aModelWine;

-(IBAction)displayWeb:(id)sender;


@end
