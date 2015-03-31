//
//  ViewHistorial.m
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 10/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ViewHistorial.h"
#import "cell.h"


@interface ViewHistorial ()

@end

@implementation ViewHistorial

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  NSLog(@"historiaaaaaallll");
      self.txtPaciente.text = _no_paciente;
     NSLog(@"IDPaciente:  %@", _no_paciente);
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"pacientes"];
    [query whereKey:@"objectId" equalTo:self.txtPaciente.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            //NSLog(@"Successfully retrieved %d scores.", objects.count);
            for (PFObject *object in objects) {
                NSLog(@"IDPaciente:  %@", object.objectId);
                // NSLog(@"IDPacienteVARRRR:  %@", idpaciente);
                NSString *nom=object[@"nom_paciente"];
                nom= [nom stringByAppendingString: @" " ];
                nom= [nom stringByAppendingString: object[@"ap_paterno"] ];
                nom= [nom stringByAppendingString: @" " ];
                nom= [nom stringByAppendingString: object[@"ap_materno"] ];
                self.txtNomCompleto.text=  nom ;
                
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




@end
