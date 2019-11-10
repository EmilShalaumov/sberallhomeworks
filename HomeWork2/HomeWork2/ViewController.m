//
//  ViewController.m
//  HomeWork2
//
//  Created by Эмиль Шалаумов on 03/10/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import "ViewController.h"
#import "ISSGuest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ISSGuest *guest = [[ISSGuest alloc] init];
    
    [guest makeOrder];
}


@end
