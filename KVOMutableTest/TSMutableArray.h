//
//  TSMutableArray.h
//  KVOMutableTest
//
//  Created by minor on 2018/1/5.
//  Copyright © 2018年 Hotel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSMutableArray : NSObject

@property (nonatomic) NSMutableArray *items;

- (void)insertItems:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
- (void)insertObject:(id )object inItemsAtIndex:(NSUInteger)index;
- (void)addItems:(NSArray *)objects;
@end
