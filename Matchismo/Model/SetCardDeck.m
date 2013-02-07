//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Daniel Sandoval on 07/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import "SetCardDeck.h"

@implementation SetCardDeck

- (id)init {
    return [self initWithCards:81];
}

- (id)initWithCards:(NSUInteger)numberOfCards {
    NSUInteger cardsAdded = 0;
    self = [super init];
    if (self) {
        for (int rank = 1; rank <= [SetCard maxRank]; rank++) {
            for (NSString* symbol in [SetCard validSymbols]) {
                for (NSDictionary* color in [SetCard validColors]) {
                    for (NSDictionary* stroke in [SetCard validStrokes]) {
                        if (cardsAdded >= numberOfCards)
                            break;
                        SetCard* card = [[SetCard alloc] init];
                        card.rank = rank;
                        card.symbol = symbol;
                        card.stroke = stroke;
                        card.color = color;
                        [self addCard:card atTop:YES];
                        cardsAdded++;
                    }
                }
            }
        }
    }
    return self;
}

@end
