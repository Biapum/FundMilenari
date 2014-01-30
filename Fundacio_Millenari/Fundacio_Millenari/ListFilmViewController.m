//
//  ListFilmViewController.m
//  Fundacio_Millenari
//
//  Created by Valenti on 29/01/14.
//  Copyright (c) 2014 Biapum. All rights reserved.
//

#import "ListFilmViewController.h"

@interface ListFilmViewController ()
@property (nonatomic, strong) IBOutlet UITableView *tableViewFilms;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"Pelis";

    [[self.navigationController navigationBar] setTintColor:[UIColor greenColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor greenColor]];
    
    [self.navigationController.navigationItem.backBarButtonItem setTitle:@"adeuuu"];
}


/***************************
 DELEGATE METHODS TABLEVIEW
****************************/

//QUANTES FILES VOLEM
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 3;
}

//COM HA DE SER CADA CEL·LA
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"Acció";
        cell.detailTextLabel.text = @"Pelis d'acció";
    }
    else if (indexPath.row ==1)
    {
        cell.textLabel.text = @"Terror";
        cell.detailTextLabel.text = @"Pelis de terror";
    }
    else if (indexPath.row ==2)
    {
        cell.textLabel.text = @"Drama";
        cell.detailTextLabel.text = @"Pelis de nenes";
    }
    return cell;
}



@end
