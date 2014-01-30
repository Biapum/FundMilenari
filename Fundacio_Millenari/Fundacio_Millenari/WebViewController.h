//
//  WebViewController.h
//  Fundacio_Millenari
//
//  Created by Valenti on 15/01/14.
//  Copyright (c) 2014 Biapum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil webUrl:(NSString*)webUrl_;


- (IBAction) close:(id)sender;

- (IBAction) goWebBack:(id)sender;
- (IBAction) goWebForward:(id)sender;

- (IBAction) refreshMyWebClicked:(id)sender;
- (IBAction) startClicked:(id)sender;

- (IBAction) filmListButtonClicked:(id)sender;

@end
