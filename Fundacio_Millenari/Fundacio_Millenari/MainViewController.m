//
//  MainViewController.m
//  Fundacio_Millenari
//
//  Created by Valenti on 11/12/13.
//  Copyright (c) 2013 Biapum. All rights reserved.
//


/*
 UIWebView *webView = [[UIWebView alloc] init];
 [webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
 */

#import "MainViewController.h"

@interface MainViewController ()
@property (nonatomic, strong) IBOutlet UITextField *textFieldNum1;
@property (nonatomic, strong) IBOutlet UITextField *textFieldNum2;

@property (nonatomic, strong) IBOutlet UILabel              *labelSortida;
@property (nonatomic, strong) IBOutlet UILabel              *labelOperation;
@property (nonatomic, strong) IBOutlet UIButton             *buttonFerSuma;
@property (nonatomic, strong) IBOutlet UIWebView            *webViewDemo;
@property (nonatomic, strong) IBOutlet UISegmentedControl   *segmentedControlSumaResta;
@end


@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"ja soc aqui");
    [self.buttonFerSuma setBackgroundColor:[UIColor redColor]];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.0f/255 green:245.0f/255 blue:120.0f/255 alpha:1]];
    
    [self.webViewDemo loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];

}


- (IBAction)actionFerSuma:(id)sender
{
    NSLog(@"visca el barça");
    
//    UILabel *labeltest = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
//    labeltest.text = @"hola";
//    [self.view addSubview:labeltest];

    int num1 = [self.textFieldNum1.text intValue];
    int num2 = [self.textFieldNum2.text intValue];
    
    int resultat;
    
    if (self.segmentedControlSumaResta.selectedSegmentIndex == 0)
    {
        resultat = num1 + num2;
    }
    else if (self.segmentedControlSumaResta.selectedSegmentIndex ==1)
    {
        resultat = num1 - num2;
    }
    else
    {
        resultat = num1 * num2;
    }
    
    if (resultat < 0)
    {
        [self.labelSortida setTextColor:[UIColor redColor]];
    }
    else
    {
        [self.labelSortida setTextColor:[UIColor blackColor]];
    }
    
    NSString *sumaText = [NSString stringWithFormat:@"El resultat és: %i de resultat",resultat];
    
    
    self.labelSortida.text = sumaText;
}

- (IBAction) hideKeyboard:(id)sender
{
    [self.view endEditing:YES];
}

- (IBAction) segmentedControlChange:(id)sender
{
    if (self.segmentedControlSumaResta.selectedSegmentIndex == 0)
    {
        NSLog(@"Suma");
        [self.buttonFerSuma setTitle:@"Sumar" forState:UIControlStateNormal];
        [self.labelOperation setText:@"+"];
    }
    else if (self.segmentedControlSumaResta.selectedSegmentIndex == 1)
    {
        NSLog(@"Resta");
        [self.buttonFerSuma setTitle:@"Restar" forState:UIControlStateNormal];
        [self.labelOperation setText:@"-"];
    }
    else
    {
        NSLog(@"Multiplicar");
        [self.buttonFerSuma setTitle:@"Multiplicar" forState:UIControlStateNormal];
        [self.labelOperation setText:@"X"];
    }
}














@end
