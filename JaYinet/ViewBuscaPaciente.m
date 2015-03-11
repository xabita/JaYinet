//
//  ViewBuscaPaciente.m
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 10/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ViewBuscaPaciente.h"

@interface ViewBuscaPaciente ()

@end

@implementation ViewBuscaPaciente

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

- (IBAction)btnBuscar:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"pacientes"];
    [query whereKey:@"objectId" equalTo:self.txtPaciente.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
                 NSLog(@"%@", object);
                self.lblNombre.text= object[@"nom_paciente"]; object[@"nom_paciente"]; object[@"nom_paciente"];
                
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}
@end
