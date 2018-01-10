//
//  EmployeeViewController.m
//  People
//
//  Created by Bruno Medeiros Rafael on 10/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

#import "EmployeeViewController.h"
#import "People-Swift.h"

@interface EmployeeViewController ()
@property (nonatomic, strong) EmployeeManager *manager;
@end

@implementation EmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)loadWithLogin:(NSString *)login {
    self.manager = [[EmployeeManager alloc] init];
    [self.manager getEmployeeWithUser:login completion:^(Employee * _Nullable employee, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
        NSLog(@"%@", employee.name);
    }];
}

@end
