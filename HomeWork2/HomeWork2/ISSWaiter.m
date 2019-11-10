//
//  ISSWaiter.m
//  HomeWork2
//
//  Created by Эмиль Шалаумов on 03/10/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import "ISSWaiter.h"
#import "ISSKitchen.h"
#import "KitchenProtocol.h"

@interface ISSWaiter () <KitchenProtocol>

@property (nonatomic, strong) ISSKitchen *kitchen;

@end

@implementation ISSWaiter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.kitchen = [[ISSKitchen alloc] init];
        self.kitchen.delegate = self;
    }
    return self;
}

- (void)makeOrderToWaiter
{
    NSLog(@"Guest has made order to waiter.");
    [self.kitchen passOrderToKitchen];
}

- (void)payTipsToWaiterWithAmount: (NSUInteger)amount
{
    NSLog(@"Guest has paid %lu tips to waiter.", amount);
    [self.delegate waiterDidGetTips];
}

# pragma actions - KitchenProtocol method implementation

- (void)kitchenDidCookOrder {
    NSLog(@"Waiter has got cooked order from kitchen.");
    [self.delegate waiterDidBringOrder];
}

@end
