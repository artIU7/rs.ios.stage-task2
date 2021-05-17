#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSString *result;
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    NSUInteger arrayCount = 0;
    if ([ numbersArray isEqualToArray: @[] ] || [ numbersArray count] == 0) {
        return @"";
    }
    
    for ( NSNumber  *element in numbersArray ) {
        if ( [ element intValue ] < 0 ) {
            result = [ [NSString alloc ] initWithFormat:@"Negative numbers are not valid for input."];
            return  result;
        }
        if ( [ element intValue ] > 255 ) {
            result = [ [NSString alloc ] initWithFormat:@"The numbers in the input array can be in the range from 0 to 255." ];
            return  result;
        }
        if (arrayCount < 4 ) {
            [ temp addObject: element ];
            arrayCount += 1;
        }
    }
    if (temp.count == 4) {
            result = [ [NSString alloc ] initWithFormat:@"%d.%d.%d.%d",
                      [ temp[0] intValue ],
                      [ temp[1] intValue ],
                      [ temp[2] intValue ],
                      [ temp[3] intValue ]
                      ];
        } else if (temp.count == 3) {
        result = [ [NSString alloc ] initWithFormat:@"%d.%d.%d.%d",
                  [ temp[0] intValue ],
                  [ temp[1] intValue ],
                  [ temp[2] intValue ],
                  0
                  ];
        } else if (temp.count == 2) {
        result = [ [NSString alloc ] initWithFormat:@"%d.%d.%d.%d",
                  [ temp[0] intValue ],
                  [ temp[1] intValue ],
                  0,
                  0
                  ];
        } else if (temp.count == 1) {
        result = [ [NSString alloc ] initWithFormat:@"%d.%d.%d.%d",
                  [ temp[0] intValue ],
                  0,
                  0,
                  0
                  ];
    }
    return  result;
}

@end
