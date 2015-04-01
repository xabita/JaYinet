//
//  ViewSesion.m
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 15/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ViewSesion.h"

UIAlertView     *alert;

@interface ViewSesion ()

@end

@implementation ViewSesion

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




- (IBAction)btnEntrar:(id)sender {
  
   /*  if ([self.txtUsuario.text isEqualToString:@"eli"] && [self.txtPassword.text isEqualToString:@"eli"]) {
        NSLog(@"HolAAA");
    }else
    { NSLog(@"MALLLL MALLL MALLL");}
    */
    
    [PFUser logInWithUsernameInBackground:self.txtUsuario.text password:self.txtPassword.text
                        block:^(PFUser *user, NSError *error) {
                        if (user) {
                            NSLog(@"logueadooooo");
                                            // Associate the device with a user
                                           PFInstallation *installation = [PFInstallation currentInstallation];
                                            installation[@"user"] = [PFUser currentUser];
                                            [installation saveInBackground];
    
                                            [self performSegueWithIdentifier:@"SessionSegue" sender:self];
                                            
                                            
                                        } else {
                                            
                                            alert = [[UIAlertView alloc] initWithTitle:@"Alerta Oaxaca"
                                                                               message:@"Error de inicio de sesion"
                                                                              delegate:self
                                                                     cancelButtonTitle:@"Cancelar"
                                                                     otherButtonTitles: nil];
                                            [alert show];
                                            
                                            [self performSegueWithIdentifier:@"segueCerrarSesion" sender:self];
                                            
                                            
                                            
                                        }
                                    }];
    
    
    
    
}
@end
