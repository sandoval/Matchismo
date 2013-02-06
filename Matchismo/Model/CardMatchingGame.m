//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Daniel Sandoval on 03/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (readwrite, nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@property (readwrite, strong, nonatomic) NSString *lastPlay;
@end

@implementation CardMatchingGame

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1
- (void)flipCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if (card && !card.isUnplayable) {
        if (card.isFaceUp) {
            self.lastPlay = @"";
        } else {
            self.lastPlay = [NSString stringWithFormat:@"Flipped %@", card.contents];
        }
        self.score -= FLIP_COST;
        card.faceUp = !card.isFaceUp;
        if ([self countOfPlayableCardsFacingUp] == self.numberOfCardsToMatch) {
            [self matchCardsFacingUp];
        }
    }
}

- (void) matchCardsFacingUp {
    NSMutableArray* cardsToMatch = [[NSMutableArray alloc] init];
    NSMutableString *cardsContents = [[NSMutableString alloc] init];
    for (Card* card in self.cards) {
        if (card.isFaceUp && !card.isUnplayable) {
            [cardsToMatch addObject:card];
            [cardsContents appendFormat:@"%@ ", card.contents];
        }
    }
    Card* card = [cardsToMatch lastObject];
    [cardsToMatch removeObject:card];
    
    
    int matchScore = [card match:cardsToMatch];
    if (matchScore) {
        for (Card* card in cardsToMatch)
            card.unplayable = YES;
        card.unplayable = YES;
        self.score += matchScore * MATCH_BONUS;
        
        self.lastPlay = [NSString stringWithFormat:@"Cards match: %@", cardsContents];
    } else {
        for (Card* card in cardsToMatch)
            card.faceUp = NO;
        card.faceUp = NO;
        self.score -= MISMATCH_PENALTY;
        self.lastPlay = [NSString stringWithFormat:@"Cards don't match: %@", cardsContents];
    }
}

- (int) countOfPlayableCardsFacingUp {
    int count = 0;
    for (Card* card in self.cards)
        if (card.isFaceUp && !card.isUnplayable) count++;
    return count;
}

- (BOOL) hasPlayableCardFaceUp {
    for (Card* card in self.cards)
        if (card.isFaceUp && !card.isUnplayable) return YES;
    return NO;
}

- (Card*) cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        self.numberOfCardsToMatch = 2;
        for (int i=0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card)
                self.cards[i] = card;
            else
                return nil;
        }
    }
    
    return self;
}

- (NSMutableArray*) cards {
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id) init {
    return nil;
}
@end
