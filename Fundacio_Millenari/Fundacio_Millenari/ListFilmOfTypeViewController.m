//
//  ListFilmOfTypeViewController.m
//  Fundacio_Millenari
//
//  Created by Valenti on 05/02/14.
//  Copyright (c) 2014 Biapum. All rights reserved.
//

#import "ListFilmOfTypeViewController.h"

@interface ListFilmOfTypeViewController ()
@property (nonatomic, strong) NSString *myFilmType;
@end

@implementation ListFilmOfTypeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil filmType:(NSString*)filmTypeName
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.myFilmType = filmTypeName;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = self.myFilmType;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
