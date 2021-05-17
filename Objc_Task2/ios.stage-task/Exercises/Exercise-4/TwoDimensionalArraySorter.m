#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray *result = [ [NSMutableArray alloc ] init ];
    NSMutableArray *subString = [ [NSMutableArray alloc ] init ];
    NSMutableArray *subNumber = [ [NSMutableArray alloc ] init ];
    if ( array == nil  ) {
        return @[];
    }
    if ( ![ array.firstObject isKindOfClass: NSArray.class ] ) {
        return @[];
    }
    
    for (NSArray *arraySub in array) {
        NSLog(@" %@", arraySub);
        if ( [ arraySub.firstObject isKindOfClass: NSString.class ] ) {
            [ subString addObjectsFromArray: arraySub ];
        } else if ( [ arraySub.firstObject isKindOfClass: NSNumber.class ] ) {
            [ subNumber addObjectsFromArray: arraySub ];
        }
    }
   
    if ( [ subString isEqualToArray: @[] ]) {
        [ subNumber sortUsingSelector:@selector(compare:)];
        [ result addObjectsFromArray: subNumber ];//= subNumber;
    } else if ( [ subNumber isEqualToArray: @[] ] ) {
        [subString sortUsingSelector:@selector(compare:)];
        [ result addObjectsFromArray: subString ];
    } else {
        [ subNumber sortUsingSelector:@selector(compare:)];
        [ subString sortUsingSelector:@selector(compare:)];
        NSArray *temp = [[ subString reverseObjectEnumerator] allObjects ];
        [ result  addObject: subNumber ];
        [ result  addObject: temp ];
        
        //[ result addObjectsFromArray: subNumber ];
        //[ result addObjectsFromArray: subString ];
        
    }
    NSLog(@" Firs array (NSString) : %@\nSecond array (NSNumber) : %@", subString,  subNumber);
    return result;
}

@end
