//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Daniel Sandoval on 03/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

// Designated Initializer
- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

- (BOOL) hasPlayableCardFaceUp;

@property (readonly, nonatomic) int score;
@property (readonly, strong, nonatomic) NSAttributedString* attributedLastPlay;
@property (nonatomic) int numberOfCardsToMatch;
@end
