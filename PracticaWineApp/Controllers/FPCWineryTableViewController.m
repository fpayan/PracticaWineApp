//
//  FPCWineryTableViewController.m
//  PracticaWineApp
//
//  Created by Francisco Payán Calero on 3/11/17.
//  Copyright © 2017 Francisco Payán Calero. All rights reserved.
//

#import "FPCWineryTableViewController.h"
#import "FPCWineViewController.h"
#import "FPCWineModel.h"

@interface FPCWineryTableViewController ()

@end

@implementation FPCWineryTableViewController

-(id) initWithModel:(FPCWineryModel *) aModel style:(UITableViewStyle) aStyle{
    if (self = [super initWithStyle:(UITableViewStyle)aStyle]) {
        _modelWinery = aModel;
        self.title = @"Wine App FPC";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *bg = [UIColor colorWithRed:0.5
                                  green:0
                                   blue:0.13
                                  alpha:1];
    [self.navigationController.navigationBar setBarTintColor:bg];
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
// #warning Incomplete implementation, return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
// #warning Incomplete implementation, return the number of rows
    NSInteger count = 0;
    if (section == RED_WINE_SECTION) {
        count = (NSInteger) [self.modelWinery redWineCount];
    }else if (section == WHITE_WINE_SECTION){
        count = (NSInteger) [self.modelWinery whiteWineCount];
    }else{
        count = (NSInteger) [self.modelWinery otherWineCount];
    }
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //static NSString *CellIdentifier = @"reuseIdentifier";
    static NSString *CellIdentifier = @"WineCell";
    
    // Averiguamos de qué vino se trata
    FPCWineModel *wine = [self wineForIndexPath:indexPath];
    // Creamos una celda
    UITableViewCell *wineCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // It've cell ?
    if (wineCell == nil) {
        // create cell if not exist
        wineCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // To know which model we are talking about.
    /*
    if(indexPath.section == RED_WINE_SECTION){
        wine = [self.modelWinery redWineAtIndex:(int)indexPath.row];
    }else if(indexPath.section == WHITE_WINE_SECTION){
        wine = [self.modelWinery whiteWineAtIndex:(int)indexPath.row];
    }else {
        wine = [self.modelWinery otherWineAtIndex:(int)indexPath.row];
    }
    */
    // Sincronizamos modelo con vista (celda)..
    wineCell.imageView.image = wine.photo;
    wineCell.textLabel.text = wine.name;
    wineCell.detailTextLabel.text = wine.wineCompanyName;
    //
    return wineCell;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName = nil;
    
    if (section == RED_WINE_SECTION) {
        sectionName = @"Tinto";
    }
    else if (section == WHITE_WINE_SECTION){
        sectionName = @"Blanco";
    }
    else{
        sectionName = @"Otros";
    }
    
    return sectionName;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view delegate
/* Add events */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Suponemos que estamos en un Navigation Controller.
    // Averiguamos de que vino se trata.
    FPCWineModel *wine = [self wineForIndexPath:indexPath];
    /*
    if(indexPath.section == RED_WINE_SECTION){
        wine = [self.modelWinery redWineAtIndex:(int)indexPath.row];
    }else if(indexPath.section == WHITE_WINE_SECTION){
        wine = [self.modelWinery whiteWineAtIndex:(int)indexPath.row];
    }else {
        wine = [self.modelWinery otherWineAtIndex:(int)indexPath.row];
    }
     */
    // Creamos un controlador para dicho vino.
    FPCWineViewController *wineVController = [[FPCWineViewController alloc] initWithModel:wine];
    
    // Hacemos un push al navigation controller dentro del cual estamos.
    [self.navigationController pushViewController:wineVController animated:YES];
}

#pragma mark -  AGTWineryTableViewControllerDelegate

- (void)wineryTableViewController:(FPCWineryTableViewController *)aWineryVC
                    didSelectWine:(FPCWineModel *)aWine
{
    // Crear el controlador
    FPCWineViewController *wineVC = [[FPCWineViewController alloc] initWithModel:aWine];
    
    // Hacer un push
    [self.navigationController pushViewController:wineVC
                                         animated:YES];
}

#pragma mark -  Utils

- (FPCWineModel *)wineForIndexPath:(NSIndexPath *)indexPath
{
    // Averiguamos de qué vino se trata
    FPCWineModel *wine = nil;
    
    if (indexPath.section == RED_WINE_SECTION) {
        wine =  [self.modelWinery redWineAtIndex:indexPath.row];
    }
    else if (indexPath.section == WHITE_WINE_SECTION) {
        wine = [self.modelWinery whiteWineAtIndex:indexPath.row];
    }
    else {
        wine = [self.modelWinery otherWineAtIndex:indexPath.row];
    }
    
    return wine;
}


@end
