//
//  ViewConsultarPaciente.h
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 16/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewConsultarPaciente : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnRegresar;
@property (strong, nonatomic) IBOutlet UIButton *btnRegistrar;
@property (strong, nonatomic) IBOutlet UIButton *btnHistorial;
@property (strong, nonatomic) IBOutlet UIButton *btnBuscar;
@property (strong, nonatomic) IBOutlet UILabel *lblTitulo;


@property (strong, nonatomic) IBOutlet UITextField *txtPaciente;
@property (strong, nonatomic) IBOutlet UITextField *txtRespaciente;


@property (strong, nonatomic) IBOutlet UILabel *lblEstado;
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UITextField *txtPaterno;
@property (strong, nonatomic) IBOutlet UITextField *txtMaterno;




@property (strong, nonatomic) IBOutlet UILabel *lblDatos;

- (IBAction)btnBuscar:(id)sender;

@end








