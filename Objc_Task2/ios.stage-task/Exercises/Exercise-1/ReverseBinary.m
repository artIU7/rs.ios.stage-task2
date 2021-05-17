#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 res = 0;
    NSUInteger counter = 8;
    while ( counter > 0) {
        res = (res << 1) | (n & 1);
        n >>= 1;
        counter -= 1;
    }
    return res;
}
