//
//  PlayingCard.m
//  Matchismo
//
//  Created by Daniel Sandoval on 03/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (int) match:(NSArray *)otherCards {
    int score = 0;
    int cardsWithRank = 0;
    int cardsWithSuit = 0;
    for (PlayingCard* card in otherCards) {
        if (self.rank == card.rank) cardsWithRank++;
        if ([self.suit isEqualToString:card.suit]) cardsWithSuit++;
    }
    if (cardsWithRank == [otherCards count])
        score += (cardsWithRank+1)*4;
    if (cardsWithSuit == [otherCards count])
        score += (cardsWithRank+1);
    return score;
}

- (NSString *) suit {
    return _suit ? _suit : @"?";
}

- (void) setSuit:(NSString*)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void) setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (NSString *) contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (NSAttributedString *) attributedContents {
    return [[NSAttributedString alloc] initWithString:self.contents];
}

+ (NSUInteger) maxRank {
    return [self rankStrings].count-1;
}

+ (NSArray*) rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSArray*) validSuits {
    return @[@"♥",@"♦",@"♠",@"♣"];
}

@end