//
//  ViewBuscaPaciente.m
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 10/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ViewBuscaPaciente.h"
#import "ViewEstado.h"
#import "ViewHistorial.h"

NSString *idpaciente;

@interface ViewBuscaPaciente ()

@end

@implementation ViewBuscaPaciente


- (void)viewDidLoad {
    [super viewDidLoad];

    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
         NSLog(@"Usuario Actual :: %@", currentUser);
    } else {
        // show the signup or login screen
    }
    
    
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


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"segueRespaciente retrieved %@", @"saga");
    if ([[segue identifier] isEqualToString:@"segueRespaciente"]) {
        ViewEstado *segundoView = [segue destinationViewController];
        segundoView.nopaciente = self.txtRespaciente.text;
    }
    
    
    if ([[segue identifier] isEqualToString:@"segueHistorial"]) {
        NSLog(@"selftxt  %@", self.txtRespaciente.text);
        ViewHistorial *Viewhist = [segue destinationViewController];
        Viewhist.no_paciente = self.txtRespaciente.text;
    }
}


- (IBAction)btnBuscar:(id)sender {
    
    PFQuery *query = [PFQuery queryWithClassName:@"pacientes"];
    [query whereKey:@"objectId" equalTo:self.txtPaciente.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            //NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                
                idpaciente=object.objectId;
                
                NSLog(@"IDPaciente:  %@", object.objectId);
               // NSLog(@"IDPacienteVARRRR:  %@", idpaciente);
                self.txtRespaciente.text= object.objectId;
                self.txtNombre.text= object[@"nom_paciente"];
                self.txtPaterno.text= object[@"ap_paterno"];
                self.txtMaterno.text= object[@"ap_materno"];
            
                PFQuery *queryE = [PFQuery queryWithClassName:@"historial"];
                [queryE whereKey:@"id_pac" equalTo:idpaciente];
                [queryE findObjectsInBackgroundWithBlock:^(NSArray *objectsHist, NSError *errorh) {
                    if (!errorh) {
                        // The find succeeded.
                        NSLog(@"Successfully retrieved %d scores.", objectsHist.count);
                        // Do something with the found objects
                        for (PFObject *objectH in objectsHist) {
                            NSLog(@"OBjHistorial....%@", objectH.objectId);
                            NSLog(@"Estado-..---%@", objectH);
                            self.lblEstado.text= objectH[@"desc_estado"];
                        }
                    } else {
                        // Log details of the failure
                        NSLog(@"Error: %@ %@", errorh, [errorh userInfo]);
                    }
                }];
                
                
            
            
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
    
   //  NSLog(@"aaaaaIDPaciente ::::  %@", idpaciente);
    /*
   */
    
}
@end
