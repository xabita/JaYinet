//
//  ViewRegistro.h
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 09/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface ViewRegistro : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblTitulo;
@property (strong, nonatomic) IBOutlet UILabel *lblInstruccion;
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UITextField *txtPaterno;
@property (strong, nonatomic) IBOutlet UITextField *txtMaterno;
@property (strong, nonatomic) IBOutlet UITextField *txtDomicilio;
@property (strong, nonatomic) IBOutlet UILabel *lblEstado;
@property (strong, nonatomic) IBOutlet UITextView *txtEstado;
@property (strong, nonatomic) IBOutlet UIButton *btnGuardar;
@property (strong, nonatomic) IBOutlet UIButton *btnRegresar;
@property (strong, nonatomic) IBOutlet UILabel *lblResponsable;
@property (strong, nonatomic) IBOutlet UITextField *txtResponsable;
@property (strong, nonatomic) IBOutlet UITextField *txtCelular;

@property (strong, nonatomic) IBOutlet UITextField *txtCama;

@property (strong, nonatomic) IBOutlet UITextField *txtArea;
@property (strong, nonatomic) IBOutlet UILabel *lblCama;
@property (strong, nonatomic) IBOutlet UILabel *lblArea;



- (IBAction)btnGuardar:(id)sender;

@end
