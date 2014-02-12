//
//  ListFilmViewController.m
//  Fundacio_Millenari
//
//  Created by Valenti on 29/01/14.
//  Copyright (c) 2014 Biapum. All rights reserved.
//

#import "ListFilmViewController.h"

#import "ListFilmOfTypeViewController.h"

@interface ListFilmViewController ()
@property (nonatomic, strong) IBOutlet UITableView  *tableViewFilms;
@property (nonatomic, strong) NSMutableArray        *arrayFilms;
@end

@implementation ListFilmViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Metode que s'executa al carregar la pantalla
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"Pelis";

    [[self.navigationController navigationBar] setTintColor:[UIColor greenColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor greenColor]];//idem linia anterior
    
    self.arrayFilms = [[NSMutableArray alloc] initWithObjects:@"Acció", @"Terror",@"Animació",@"Dibuixos",@"Comedia",nil];

    NSLog(@"Pintem l'array de pel·licules: %@", self.arrayFilms);
}


/***************************
 DELEGATE METHODS TABLEVIEW
****************************/

//QUANTES FILES VOLEM
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.arrayFilms count];
}

//COM HA DE SER CADA CEL·LA. s'executa per cada cel·la.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSString *stringFilmName = [self.arrayFilms objectAtIndex:indexPath.row];
    cell.textLabel.text = stringFilmName;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    

    
//    if (indexPath.row == 1)
//    {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }
    
    return cell;
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"la fila seleccionada es: %li",(long)indexPath.row);

    //Recuparem el nom de la peli de la fila seleccionada
    NSString *stringFilmName = [self.arrayFilms objectAtIndex:indexPath.row];

    
    //Creem la pantalla a memoria
    ListFilmOfTypeViewController *novaPantalla = [[ListFilmOfTypeViewController alloc] initWithNibName:@"ListFilmOfTypeViewController" bundle:nil filmType:stringFilmName];
    
    //Navaguem a la dreta
    [self.navigationController pushViewController:novaPantalla animated:YES];
}




@end
