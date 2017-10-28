//
//  FPCWineryModel.h
//  PracticaWineApp
//
//  Created by Francisco Payán Calero on 23/10/17.
//  Copyright © 2017 Francisco Payán Calero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FPCWineModel.h"

@interface FPCWineryModel : NSObject

@property (readonly, nonatomic) NSUInteger redWineCount;
@property (readonly, nonatomic) NSUInteger whiteWineCount;
@property (readonly, nonatomic) NSUInteger otherWineCount;


-(FPCWineModel *) redWineAtIndex: (int) index;
-(FPCWineModel *) whiteWineAtIndex: (int) index;
-(FPCWineModel *) otherWineAtIndex: (int) index;


@end
