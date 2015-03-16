//
//  ViewRegistro.m
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 09/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ViewRegistro.h"
NSString *idpac;

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
    /*
   //pacientes
    PFObject *pacienteObject = [PFObject objectWithClassName:@"pacientes"];
     pacienteObject[@"nom_paciente"] = self.txtNombre.text;
     pacienteObject[@"ap_paterno"] = self.txtPaterno.text;
     pacienteObject[@"ap_materno"] = self.txtMaterno.text;
     pacienteObject[@"domicilio"] = self.txtDomicilio.text;
    // [pacienteObject saveInBackground];
    
    
    //estado inicial
    PFObject *estadoObject = [PFObject objectWithClassName:@"historial"];
    estadoObject[@"desc_estado"] = self.txtEstado.text;
    // Add a relation between the Post and Comment
    estadoObject[@"idpaciente"] = pacienteObject;    //estadoObject[@"id_pac"] = pacienteObject;

    [estadoObject saveInBackground];
    //datos responsable
    PFObject *responsableObject = [PFObject objectWithClassName:@"responsables"];
    responsableObject[@"nom_responsable"] = self.txtResponsable.text;
    responsableObject[@"no_movil"] = self.txtCelular.text;
    responsableObject[@"idpaciente"] = pacienteObject;

    
    [responsableObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Guardando idddd %@", pacienteObject.objectId);
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];*/
    
    
    PFObject *pacienteObject = [PFObject objectWithClassName:@"pacientes"];
    pacienteObject[@"nom_paciente"] = self.txtNombre.text;
    pacienteObject[@"ap_paterno"] = self.txtPaterno.text;
    pacienteObject[@"ap_materno"] = self.txtMaterno.text;
    pacienteObject[@"domicilio"] = self.txtDomicilio.text;
    [pacienteObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            
            
            // The object has been saved.
            idpac=pacienteObject.objectId;
              NSLog(@"Guardando idddd %@", idpac);
            
            
          /*  PFObject *estadoObject = [PFObject objectWithClassName:@"historial"];
            estadoObject[@"desc_estado"] = self.txtEstado.text;
            // Add a relation between the Post and Comment
           // estadoObject[@"idpaciente"] = pacienteObject;
            estadoObject[@"id_pac"] =  idpac;*/
            
            PFObject *estadoObject = [PFObject objectWithClassName:@"historial"];
            estadoObject[@"desc_estado"] = self.txtEstado.text;
            estadoObject[@"id_pac"] = idpac;
            estadoObject[@"num_cama"] = self.txtCama.text;
            estadoObject[@"id_area"] = self.txtArea.text;

            [estadoObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                     NSLog(@"historial guardado %@", estadoObject.objectId);
                } else {
                    // There was a problem, check error.description
                }
            }];
            
            
            PFObject *responsableObject = [PFObject objectWithClassName:@"responsables"];
        
            responsableObject[@"nom_responsable"] = self.txtResponsable.text;
            responsableObject[@"no_movil"] = self.txtCelular.text;
            responsableObject[@"id_pac"] = idpac;
            
            [responsableObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"responsables guardado %@", responsableObject.objectId);
                } else {
                    // There was a problem, check error.description
                }
            }];

            
            

            
            
            
            
            
        } else {
            // There was a problem, check error.description
        }
    }];
    
    
}
@end
