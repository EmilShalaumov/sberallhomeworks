//
//  ISSQuickSort.m
//  HomeWork1
//
//  Created by Эмиль Шалаумов on 26/09/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

#import "ISSQuickSort.h"

@implementation ISSQuickSort



/**
 Quick Sort algorithm implementation

 @param sourceArray array to be sorted
 @param sortOrder order direction (@"asc" - ascendance, @"desc" - descendance
 @return sorted array
 */
+ (NSArray*)quickSortArray:(NSArray *)sourceArray withOrdering: (NSString*)sortOrder
{
    int count = (int)[sourceArray count];
    if (count <= 1) {
        return sourceArray;
    }
    
    int pivot = [[sourceArray objectAtIndex: (count/2)] intValue];
    NSMutableArray *smallerThanArray = [NSMutableArray array];
    NSMutableArray *largerThanArray = [NSMutableArray array];
    NSMutableArray *pivotArray = [NSMutableArray array];
    [pivotArray addObject: @(pivot)];
    
    for (int e = 0; e < count; e++) {
        int num = [[sourceArray objectAtIndex:e] intValue];
        
        if ((num < pivot && [sortOrder isEqualToString:@"asc"])
            || (num > pivot && [sortOrder isEqualToString:@"desc"])) {
            [smallerThanArray addObject: @(num)];
        } else if ((num > pivot && [sortOrder isEqualToString:@"asc"])
                   || (num < pivot && [sortOrder isEqualToString:@"desc"])) {
            [largerThanArray addObject: @(num)];
            // To address the possibly duplicate that is defined in the pivot, in this case 4.
        } else if (e != (count/2) && pivot == num) {
            [pivotArray addObject: @(num)];
        }
    }
    
    NSMutableArray *returnArray = [NSMutableArray array];
    [returnArray addObjectsFromArray: [self quickSortArray: smallerThanArray withOrdering:sortOrder]];
    [returnArray addObjectsFromArray: pivotArray];
    [returnArray addObjectsFromArray: [self quickSortArray: largerThanArray withOrdering:sortOrder]];
    
    return returnArray;
}

@end
