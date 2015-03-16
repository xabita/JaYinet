//
//  ViewHistorial.h
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 10/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewHistorial : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnRegresar;
@property (strong, nonatomic) IBOutlet UIButton *btnEstado;
@property (strong, nonatomic) IBOutlet UITextField *txtPaciente;
@property (strong, nonatomic) IBOutlet UITextView *txtNomCompleto;

@property (nonatomic, strong) NSString *no_paciente;


@end
