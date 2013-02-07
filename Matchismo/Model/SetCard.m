//
//  SetCard.m
//  Matchismo
//
//  Created by Daniel Sandoval on 07/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

-(int)match:(NSArray *)otherCards {
    NSMutableArray* cards = [otherCards mutableCopy];
    [cards addObject:self];
    NSCountedSet *properties = [[NSCountedSet alloc] init];
    for (SetCard* card in cards) {
        [properties addObject:card.symbol];
        [properties addObject:card.color];
        [properties addObject:card.stroke];
        [properties addObject:@(card.rank)];
    }
    for (id prop in properties)
        if ([properties countForObject:prop] == 2)
            return 0;
    return 10;
}

- (NSString*)contents {
    return [self.attributedContents string];
}

- (NSAttributedString*) attributedContents {
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] initWithDictionary:self.color];
    [attributes addEntriesFromDictionary:self.stroke];
    return [[NSMutableAttributedString alloc]
            initWithString:[NSString stringWithFormat:@"%@%@", self.rankString, self.symbol]
            attributes:attributes];
}

- (void)setSymbol:(NSString *)symbol {
    if ([[[self class] validSymbols] containsObject:symbol])
        _symbol = symbol;
}

- (void)setColor:(NSDictionary *)color {
    if ([[[self class] validColors] containsObject:color])
        _color = color;
}

- (void)setStroke:(NSDictionary *)stroke {
    if ([[[self class] validStrokes] containsObject:stroke])
        _stroke = stroke;
}

- (void)setRank:(NSUInteger)rank {
    if (rank <= [[self class] maxRank])
        _rank = rank;
}

- (NSString*)rankString {
    return [[self class] rankStrings][self.rank];
}

+ (NSArray*)validSymbols {
    return @[@"▲",@"●",@"■"];
}

+ (NSArray*)validColors {
    return @[@{NSStrokeColorAttributeName : [UIColor redColor], NSForegroundColorAttributeName : [UIColor redColor]},
             @{NSStrokeColorAttributeName : [UIColor greenColor], NSForegroundColorAttributeName : [UIColor greenColor]},
             @{NSStrokeColorAttributeName : [UIColor purpleColor], NSForegroundColorAttributeName : [UIColor purpleColor]}];
}

+ (NSArray*)validStrokes {
    return @[@{NSStrokeWidthAttributeName: @0, NSUnderlineStyleAttributeName: @(NSUnderlineStyleNone)},
             @{NSStrokeWidthAttributeName: @5, NSUnderlineStyleAttributeName: @(NSUnderlineStyleNone)},
             @{NSStrokeWidthAttributeName: @0, NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)}];
}

+ (NSArray*)rankStrings {
    return @[@"?", @"1", @"2", @"3"];
}

+ (NSUInteger)maxRank {
    return [[self rankStrings] count] - 1;
}

@end
