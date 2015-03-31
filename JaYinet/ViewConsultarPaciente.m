//
//  ViewConsultarPaciente.m
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 16/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ViewConsultarPaciente.h"
#import "ViewRegistroResponsable.h"
#import "ViewHistorialPaciente.h"
UIAlertView *alert;


NSString *idpaciente;
@interface ViewConsultarPaciente ()

@end

@implementation ViewConsultarPaciente

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


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
 
    
    NSLog(@"segueRespaciente retrieved %@", @"segueRegistro");
    if ([[segue identifier] isEqualToString:@"segueRegistro"]) {
        NSLog(@"selftxt  %@", self.txtRespaciente.text);
        ViewRegistroResponsable *Viewhist = [segue destinationViewController];
        Viewhist.idpaciente = self.txtRespaciente.text;
    }

    /*
    
    NSLog(@"segueRespaciente retrieved %@", @"saga");
 if ([[segue identifier] isEqualToString:@"segueHistorial"]) {
        NSLog(@"selftxt  %@", self.txtRespaciente.text);
        ViewHistorial *Viewhist = [segue destinationViewController];
        Viewhist.no_paciente = self.txtRespaciente.text;
    }*/
}



- (IBAction)btnBuscar:(id)sender {

    
    [PFUser logInWithUsernameInBackground:self.txtRespaciente.text password:self.txtRespaciente.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            NSLog(@"logueadooooo");
                                            // Associate the device with a user
                                            PFInstallation *installation = [PFInstallation currentInstallation];
                                            installation[@"user"] = [PFUser currentUser];
                                            [installation saveInBackground];
                                            
                                            
                                            
                                        } else {
                                            
                                            
                                            alert = [[UIAlertView alloc] initWithTitle:@"Alerta Oaxaca"
                                                                               message:@"Error de inicio de sesion"
                                                                              delegate:self
                                                                     cancelButtonTitle:@"Cancelar"
                                                                     otherButtonTitles: nil];
                                            [alert show];
                                            
                                            
                                        }
                                    }];
    
    
    
 //crear viecontroller de iniccio de sesion de responsables
    
    
  /*
     PFUser *currentUser = [PFUser currentUser];
     if (currentUser) {
     NSLog(@"Usuario Actual :: %@", currentUser);
     } else {
     // show the signup or login screen
     }
    
    // Associate the device with a user
    PFInstallation *installation = [PFInstallation currentInstallation];
    installation[@"user"] = [PFUser currentUser];
    [installation saveInBackground];
    
    */
    
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
              
                
                
                ///
                
                PFUser *user = [PFUser user];
                user.username = self.txtRespaciente.text;
                user.password = self.txtRespaciente.text;
                
                // other fields can be set just like with PFObject
                user[@"id_paciente"] = self.txtRespaciente.text;
                
                [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (!error) {
                        // Hooray! Let them use the app now.
                        PFInstallation *installation = [PFInstallation currentInstallation];
                        installation[@"user"] = [PFUser currentUser];
                        [installation saveInBackground];
                        
                        
                    } else {
                        NSString *errorString = [error userInfo][@"error"];
                        // Show the errorString somewhere and let the user try again.
                    }
                }];

                
                
                
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    

    
}
@end
