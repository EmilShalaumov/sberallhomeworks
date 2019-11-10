//
//  KitchenProtocol.h
//  HomeWork2
//
//  Created by Эмиль Шалаумов on 05/10/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 Kitchen activity protocol
 */
@protocol KitchenProtocol <NSObject>

/**
 Notifies that kitchen has cooked the order
 */
- (void)kitchenDidCookOrder;

@end
