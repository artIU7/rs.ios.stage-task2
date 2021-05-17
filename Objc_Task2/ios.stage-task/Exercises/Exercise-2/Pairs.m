#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger counter = 0;
    for (int i = array.count - 1; i > 0; i --) {
        for (int j = i - 1; j >= 0; j --) {
            if ([array[i] intValue] - [array[j] intValue] == [ number intValue ]  ) {
                counter += 1;
            }
        }
    }
    return counter;
}

@end
