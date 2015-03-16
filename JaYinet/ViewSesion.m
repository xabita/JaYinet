//
//  ViewSesion.m
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 15/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ViewSesion.h"

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
    [PFUser logInWithUsernameInBackground:self.txtUsuario.text password:self.txtPassword.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            NSLog(@"logueadooooo");
                                        } else {
                                            // The login failed. Check error to see why.
                                        }
                                    }];
    
    
}
@end
