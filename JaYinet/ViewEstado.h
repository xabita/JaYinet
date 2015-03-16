//
//  ViewEstado.h
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 10/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewEstado : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtCama;
@property (strong, nonatomic) IBOutlet UITextField *txtArea;
@property (strong, nonatomic) IBOutlet UITextView *txtEstado;


@property (strong, nonatomic) IBOutlet UIButton *btnRegresar;

@property (strong, nonatomic) IBOutlet UIButton *btn_guardar;
- (IBAction)btn_guardar:(id)sender;

@property (nonatomic, strong) NSString *nopaciente;




@property (strong, nonatomic) IBOutlet UITextField *txtPaciente;

@end
