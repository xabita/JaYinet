//
//  ViewMenu.m
//  JaYinet
//
//  Created by Elizabeth Martínez Gómez on 16/03/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ViewMenu.h"

@interface ViewMenu ()

@end


@implementation ViewMenu

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

- (IBAction)btnCerrar:(id)sender {
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser]; // this will now be nil
}
@end
