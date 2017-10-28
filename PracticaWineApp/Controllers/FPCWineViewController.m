//
//  FPCWineViewController.m
//  PracticaWineApp
//
//  Created by Francisco Payán Calero on 21/10/17.
//  Copyright © 2017 Francisco Payán Calero. All rights reserved.
//

#import "FPCWineViewController.h"
#import "FPCWineModel.h"
#import "FPCWebViewController.h"

//@interface FPCWineViewController ()
//
//@end

@implementation FPCWineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        // Custom initialization.
    }
    return self;
}

// Sincronizamos modelo y vista
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self syncModelWineWithView];
    // Pintar view apartir de la barra de menú.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Change color tabBar.
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5
                                                                           green:0
                                                                            blue:0.13
                                                                           alpha:1];
    
}


-(id) initWithModel: (FPCWineModel *) aModelWine{
    
    if (self = [super initWithNibName:nil bundle:nil]){
        _modelWine = aModelWine;
        self.title = aModelWine.name;
    }
    
    return self;
    
}

#pragma mark - Actions
-(IBAction)displayWeb:(id)sender{
    //NSLog(@"Go to %@", self.modelWine.wineCompanyWeb);
    // Crear un WebViewController
    FPCWebViewController *webVC = [[FPCWebViewController alloc] initWithModel:self.modelWine];
    // Hacemos un push.
    [self.navigationController pushViewController:webVC
                                         animated:YES];
    
}


#pragma mark - Utils
-(void) syncModelWineWithView{
    self.nameLabel.text = self.modelWine.name;
    self.wineryNameLabel.text = self.modelWine.wineCompanyName;
    self.typeLabel.text = self.modelWine.type;
    self.originLabel.text = self.modelWine.origin;
    self.grapesLabel.text = [self arrayToString: self.modelWine.grapes];
    self.notesLabel.text = self.modelWine.notes;
    self.photoView.image = self.modelWine.photo;
    
    [self displayRaiting: self.modelWine.rating];
}
-(void) clearRatings{
    for (UIImageView *imgView in self.ratingView){
        imgView.image = nil;
    }
    
}

-(void) displayRaiting: (int) aRating{
    [self clearRatings];
    
    UIImage *glass = [UIImage imageNamed:@"splitView_score_glass"];
    for (int i = 0; i < aRating; i++){
        [[self.ratingView objectAtIndex:i] setImage:glass];
    }
}

-(NSString *) arrayToString: (NSArray *) anArray{
    NSString *repr = nil;
    
    if([anArray count] == 1){
        repr = [@"100% " stringByAppendingString:[anArray lastObject]];
    }else{
        repr = [[anArray componentsJoinedByString:@", " ] stringByAppendingString:@"."];
    }
    return repr;
}





@end
