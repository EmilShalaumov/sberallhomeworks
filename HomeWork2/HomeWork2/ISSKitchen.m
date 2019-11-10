//
//  ISSKitchen.m
//  HomeWork2
//
//  Created by Эмиль Шалаумов on 03/10/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import "ISSKitchen.h"

@implementation ISSKitchen

- (void)passOrderToKitchen
{
    NSLog(@"Waiter has passed the order to kitchen.");
    [self cookOrder];
}

- (void)cookOrder
{
    NSLog(@"Kitchen has cooked the order.");
    [self.delegate kitchenDidCookOrder];
}

@end


