//
//  ViewRegistroResponsable.h
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 16/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewRegistroResponsable : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnRegresar;
@property (strong, nonatomic) IBOutlet UIButton *btnRegistrar;
@property (strong, nonatomic) IBOutlet UITextField *txtPaciente;
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;

@property (strong, nonatomic) NSString *idpaciente;
- (IBAction)btnGuardar:(id)sender;




@end
