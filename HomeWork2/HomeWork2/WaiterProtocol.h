//
//  WaiterProtocol.h
//  HomeWork2
//
//  Created by Эмиль Шалаумов on 05/10/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Waiter responses protocol
 */
@protocol WaiterProtocol <NSObject>

/**
 Notifies that waiter has brought order to guest
 */
- (void)waiterDidBringOrder;

/**
 Notifies that waiter has got tips from guest
 */
- (void)waiterDidGetTips;

@end
