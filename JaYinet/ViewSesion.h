//
//  ViewSesion.h
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 15/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface ViewSesion : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtUsuario;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UIButton *btnEntrar;
- (IBAction)btnEntrar:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnRegresar;

@end
