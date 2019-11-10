//
//  ISSWaiter.h
//  HomeWork2
//
//  Created by Эмиль Шалаумов on 03/10/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WaiterProtocol.h"

/**
 Class implements Waiter entity
 */
@interface ISSWaiter : NSObject

@property (nonatomic, weak) id <WaiterProtocol> delegate;

/**
 Guest calls this method from waiter to make order
 */
- (void)makeOrderToWaiter;

/**
 Guest calls this method to pay tips

 @param amount tips amount guest wants to pay
 */
- (void)payTipsToWaiterWithAmount: (NSUInteger)amount;

@end
