//
//  ViewEstado.m
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 10/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ViewEstado.h"

@interface ViewEstado ()

@end

@implementation ViewEstado
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.txtPaciente.text = _nopaciente;
    

    PFQuery *query = [PFQuery queryWithClassName:@"historial"];
    [query whereKey:@"id_pac" equalTo:self.txtPaciente.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            //NSLog(@"Successfully retrieved %d scores.", objects.count);
            for (PFObject *object in objects) {
                NSLog(@"IDPaciente:  %@", object.objectId);
                // NSLog(@"IDPacienteVARRRR:  %@", idpaciente);
                self.txtCama.text= object[@"num_cama"];
                self.txtArea.text= object[@"id_area"];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    

    
    
    

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



- (IBAction)btn_guardar:(id)sender {
    NSLog(@"Se actualizó el estado del paciente correctamente");
    PFObject *estadoObject = [PFObject objectWithClassName:@"historial"];
    estadoObject[@"desc_estado"] = self.txtEstado.text;
    estadoObject[@"id_area"] = self.txtArea.text;
    estadoObject[@"id_pac"] = self.txtPaciente.text;
    estadoObject[@"num_cama"] = self.txtCama.text;
    
    [estadoObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Se actualizó el estado del paciente correctamente. %@", estadoObject.objectId);
        } else {
            // There was a problem, check error.description
        }
    }];

    
}
@end
