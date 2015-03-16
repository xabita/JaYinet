//
//  ViewRegistroResponsable.m
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 16/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ViewRegistroResponsable.h"

@interface ViewRegistroResponsable ()

@end

@implementation ViewRegistroResponsable

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtPaciente.text=_idpaciente;
    
    
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
    // Associate the device with a user
  
    PFUser *user = [PFUser user];
    user.username = self.txtPaciente.text;
    user.password = self.txtPaciente.text;
    
    // other fields can be set just like with PFObject
    user[@"id_paciente"] = self.txtPaciente.text;
    
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
@end
