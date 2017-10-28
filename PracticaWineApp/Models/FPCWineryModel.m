//
//  FPCWineryModel.m
//  PracticaWineApp
//
//  Created by Francisco Payán Calero on 23/10/17.
//  Copyright © 2017 Francisco Payán Calero. All rights reserved.
//

#import "FPCWineryModel.h"

@interface FPCWineryModel ()
// Three type of wine.
@property (strong, nonatomic) NSArray *redWines;
@property (strong, nonatomic) NSArray *whiteWines;
@property (strong, nonatomic) NSArray *otherWines;

@end


@implementation FPCWineryModel


#pragma mark - Properties
-(NSUInteger) redWineCount{
    return [self.redWines count];
}
//
-(NSUInteger) whiteWineCount{
    return [self.whiteWines count];
}
//
-(NSUInteger) otherWineCount{
    return [self.otherWines count];
}


-(id) init{

    if(self = [super init]){
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
                                              wineCompanyWeb:[NSURL URLWithString:@"https://wines4fun.com/es/champagnes-espumosos/120042-laurent-perrier-cuvee-rose-brut-3258438000001.html"]
                                                       notes:@"Es un vino con una frescura extraordinaria, aromas a frutas rojas como fresas, frambuesas o grosellas, es un vino ligero y muy bien equilibrado con una acidez extraordinaria.\n Pruébalo con sushi, ostras o marisco, pero fundamentalmente le va bien al salmón a la plancha o ahumado y al caviar!"
                                                      rating:5
                                                       photo:[UIImage imageNamed:@"champagne.jpg"]];
        
        // Add at arrays
        self.redWines = @[tintorro];
        self.whiteWines = @[albarinno];
        self.otherWines = @[champagne];
        //
    }
    return self;
}


// Implement method
-(FPCWineModel *) redWineAtIndex: (int) index{
    return [self.redWines objectAtIndex:index];
}
-(FPCWineModel *) whiteWineAtIndex: (int) index{
    return [self.whiteWines objectAtIndex:index];
}
-(FPCWineModel *) otherWineAtIndex: (int) index{
    return [self.otherWines objectAtIndex:index];
}





@end
