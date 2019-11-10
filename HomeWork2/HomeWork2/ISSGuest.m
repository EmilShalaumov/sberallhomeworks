//
//  ISSGuest.m
//  HomeWork2
//
//  Created by Эмиль Шалаумов on 03/10/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import "ISSGuest.h"
#import "ISSWaiter.h"
#import "WaiterProtocol.h"

@interface ISSGuest () <WaiterProtocol>

@property (nonatomic, strong) ISSWaiter *waiter;

@end

@implementation ISSGuest

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.waiter = [[ISSWaiter alloc] init];
        self.waiter.delegate = self;
    }
    return self;
}

- (void)makeOrder
{
    [self.waiter makeOrderToWaiter];
}

# pragma actions - WaiterProtocol methods implementation

- (void)waiterDidBringOrder {
    NSLog(@"Guest has got his order.");
    [self.waiter payTipsToWaiterWithAmount:20];
}

- (void)waiterDidGetTips
{
    NSLog(@"Waiter says: Goodbye, see you again!");
}

@end
