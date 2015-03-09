//
//  ViewRegistro.m
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 09/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ViewRegistro.h"


@interface ViewRegistro ()

@end

@implementation ViewRegistro

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnGuardar:(id)sender {
    
    
    PFObject *pacienteObject = [PFObject objectWithClassName:@"pacientes"];
     pacienteObject[@"nom_paciente"] = self.txtNombre.text;
     pacienteObject[@"ap_paterno"] = self.txtPaterno.text;
     pacienteObject[@"ap_materno"] = self.txtMaterno.text;
     pacienteObject[@"domicilio"] = self.txtDomicilio.text;
     [pacienteObject saveInBackground];
    
}
@end
