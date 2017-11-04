//
//  FPCWineModel.m
//  PracticaWineApp
//
//  Created by Francisco Payán Calero on 21/10/17.
//  Copyright © 2017 Francisco Payán Calero. All rights reserved.
//

#import "FPCWineModel.h"

@implementation FPCWineModel


#pragma mark - Class method
// Constructor/es +(id) - Métodos de clase.
+(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aURL
             notes: (NSString *) aNotes
            rating: (int) aRating
             photo: (UIImage *) aPhoto{
    
    return  [[self alloc] initWithName:aName
                       wineCompanyName:aWineCompanyName
                                  type:aType
                                origin:anOrigin
                                grapes:arrayOfGrapes
                        wineCompanyWeb:aURL
                                 notes:aNotes
                                rating:aRating
                                 photo:aPhoto];
}


+(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin{
    
    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:anOrigin];
    
}


#pragma mark - Init
// Designado
-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aURL
             notes: (NSString *) aNotes
            rating: (int) aRating
             photo: (UIImage *) aPhoto{
    //
    if(self = [super init]){
        // Asignamos los parámetros a las variables de instancia.
        // Esta forma mejor no usar.
        // ->>> [self setName:aName];
        // Asi mejor !!
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin = anOrigin;
        _grapes = arrayOfGrapes;
        _wineCompanyWeb = aURL;
        _notes = aNotes;
        _rating = aRating;
        _photo = aPhoto;
        
        
    }
    // return self or nil
    return self;
}
// Conveniencia
-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin{
    
    return [self initWithName:aName
              wineCompanyName:aWineCompanyName
                         type:aType
                       origin:anOrigin
                       grapes:nil
               wineCompanyWeb:nil
                        notes:@""
                       rating:NO_RATING
                        photo:nil];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Name: %@\nCompany name: %@\nType: %@\nOrigin: %@\nGrapes: %@\nWine company web: %@\nNotes: %@\nRating: %d\n", self.name, self.wineCompanyName, self.type, self.origin, self.grapes, self.wineCompanyWeb, self.notes, self.rating];
}


@end
