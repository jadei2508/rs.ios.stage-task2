#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSMutableString *result = [[NSMutableString alloc] init];
    if (numbersArray == nil || numbersArray.count == 0) {
        return @"";
    }
    for (int i = 0; i < 4; i++) {
        int val = 0;
        if (i < numbersArray.count) {
            val = [[numbersArray objectAtIndex:i] intValue];
        }
        if (val > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        } else if (val < 0) {
            return @"Negative numbers are not valid for input.";
        } else {
            [result appendString: @(val).stringValue];
            [result appendString:@"."];
        }
    }
    
    return [result substringToIndex:[result length] - 1];
}

@end
