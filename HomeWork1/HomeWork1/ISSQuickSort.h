//
//  ISSQuickSort.h
//  HomeWork1
//
//  Created by Эмиль Шалаумов on 26/09/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 Class that implements sorting algorithms
 */
@interface ISSQuickSort : NSObject

+ (NSArray*) quickSortArray:(NSArray*)sourceArray withOrdering: (NSString*)sortOrder;

@end
