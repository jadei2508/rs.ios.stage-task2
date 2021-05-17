#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
   NSInteger count = 0;

        if (array.count != 0) {
            for (NSNumber *item in array) {
                for (NSNumber *item2 in array) {
                    if (item.intValue - item2.intValue == number.intValue) {
                        count += 1;
                    }
                }
            }
        }
        return count;
}

@end
