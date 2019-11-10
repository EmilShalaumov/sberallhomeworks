//
//  ISSKitchen.h
//  HomeWork2
//
//  Created by Эмиль Шалаумов on 03/10/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KitchenProtocol.h"

/**
 Class implements Kitchen entity
 */
@interface ISSKitchen : NSObject

@property (nonatomic, weak) id <KitchenProtocol> delegate;

/**
 Waiter calls this method from kitchen to pass the order for cooking
 */
- (void)passOrderToKitchen;

@end
