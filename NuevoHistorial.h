//
//  NuevoHistorial.h
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 31/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/PFQueryTableViewController.h>


@interface NuevoHistorial : PFQueryTableViewController
@property (strong, nonatomic) IBOutlet UILabel *lblDescripcion;


@property (strong, nonatomic) NSString *idpaciente;

- (IBAction)btnRegresar:(id)sender;



@end
