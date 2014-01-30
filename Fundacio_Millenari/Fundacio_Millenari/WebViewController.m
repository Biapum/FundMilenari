//
//  WebViewController.m
//  Fundacio_Millenari
//
//  Created by Valenti on 15/01/14.
//  Copyright (c) 2014 Biapum. All rights reserved.
//

#import "WebViewController.h"
#import "ListFilmViewController.h"

@interface WebViewController ()

@property (nonatomic, strong) IBOutlet UIWebView            *webViewDemo;
@property (nonatomic, strong) NSString  *nomDeLaWeb;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *indicatorProgress;

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
    
    self.title = self.nomDeLaWeb;
}

//Acció de tancar la pantalla
- (IBAction) close:(id)sender
{
    //Tanca la pantalla
    [self dismissViewControllerAnimated:NO completion:nil];
}


/**********
 ACTIONS
**********/
- (IBAction) goWebBack:(id)sender
{
    [self.webViewDemo goBack];
}

- (IBAction) goWebForward:(id)sender
{
    [self.webViewDemo goForward];
}

- (IBAction) refreshMyWebClicked:(id)sender
{
    [self.webViewDemo reload];
}

- (IBAction) startClicked:(id)sender
{
    [self.webViewDemo loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:self.nomDeLaWeb]]];
}

- (IBAction) filmListButtonClicked:(id)sender
{
    NSLog(@"OBRIR PANTALLA PELIS");
    
    ListFilmViewController *vc = [[ListFilmViewController alloc] init];
    
    //Si volguessim obrir una modal
    //[self presentViewController:vc animated:YES completion:nil];
    
    //Volem navegar a la dreta
    [self.navigationController pushViewController:vc animated:YES];
}


/*****************
 WEBVIEWDELEGATES
 ****************/
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSLog(@"Estic començant");
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"ja he començant");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{

    [self.indicatorProgress setHidden:YES];
    
    NSLog(@"ja he acabat");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Hi ha hagut un error");
    
    //Mostrem error amb una alert.
    UIAlertView *alertWebError = [[UIAlertView alloc] initWithTitle:@"Error!!!" message:@"No tens internet!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Close",nil]; //Afegim els botons que volem
    
    [alertWebError show];
}

//Delegate per saber quin buto ha clicat
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}




@end
