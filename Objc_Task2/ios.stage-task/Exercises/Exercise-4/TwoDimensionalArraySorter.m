#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)unionArrays:(NSArray<NSArray *> *)array {
    NSMutableArray *collectedArray = [array valueForKeyPath:@"@unionOfArrays.self"];
    [collectedArray sortUsingSelector:@selector(compare:)];
    return collectedArray.count > 0 ? collectedArray : @[];
}

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableArray<NSArray *> *numArray = [NSMutableArray new];
    NSMutableArray<NSArray *> *strArray = [NSMutableArray new];
    NSMutableArray *resultArray = [NSMutableArray new];
    
    for (id arr in array) {
        if (![array[0] isKindOfClass:[NSArray class]]){
            return @[];
        }else if ([arr[0] isKindOfClass:[NSString class]]){
            [strArray addObject:arr];
        }else if ([arr[0] isKindOfClass:[NSNumber class]]){
            [numArray addObject:arr];
        }
    }
    
    if (numArray.count > 0 && strArray.count > 0){
        [resultArray addObject: [self unionArrays:numArray]];
        [resultArray addObject: [[[self unionArrays:strArray] reverseObjectEnumerator] allObjects]];
        return resultArray;
    }else {
        return [self unionArrays:array];
    }
}

@end
