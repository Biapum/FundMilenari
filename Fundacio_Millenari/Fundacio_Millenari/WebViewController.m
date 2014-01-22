//
//  WebViewController.m
//  Fundacio_Millenari
//
//  Created by Valenti on 15/01/14.
//  Copyright (c) 2014 Biapum. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (nonatomic, strong) IBOutlet UIWebView            *webViewDemo;
@property (nonatomic, strong) NSString  *nomDeLaWeb;
@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil webUrl:(NSString*)webUrl_
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //A la variable nomDeLaWeb li donem el valor de webUrl_ que ens passa l'altre pantalla
        self.nomDeLaWeb = webUrl_;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.webViewDemo loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:self.nomDeLaWeb]]];
}

//Acció de tancar la pantalla
- (IBAction) close:(id)sender
{
    //Tanca la pantalla
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end
