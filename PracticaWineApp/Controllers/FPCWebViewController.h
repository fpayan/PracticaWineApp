//
//  FPCWebViewController.h
//  PracticaWineApp
//
//  Created by Francisco Payán Calero on 22/10/17.
//  Copyright © 2017 Francisco Payán Calero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPCWineModel.h"

@interface FPCWebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) FPCWineModel *webWineModel;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

-(id) initWithModel:(FPCWineModel *) aWebModel;

@end
