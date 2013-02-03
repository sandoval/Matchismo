//
//  PlayingCard.h
//  Matchismo
//
//  Created by Daniel Sandoval on 03/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic,strong) NSString *suit;

@property (nonatomic) NSUInteger rank;

+ (NSUInteger) maxRank;
+ (NSArray*) validSuits;

@end