//
//  ViewMenu.h
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 16/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewMenu : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnRegistro;
@property (strong, nonatomic) IBOutlet UIButton *btnConsultar;
@property (strong, nonatomic) IBOutlet UIButton *btnCerrar;
- (IBAction)btnCerrar:(id)sender;

@end
