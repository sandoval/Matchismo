//
//  SetCard.h
//  Matchismo
//
//  Created by Daniel Sandoval on 07/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property(strong,nonatomic) NSString* symbol;
@property(strong,nonatomic) NSDictionary* color;
@property(strong,nonatomic) NSDictionary* stroke;
@property(readonly,nonatomic) NSString* rankString;
@property(nonatomic) NSUInteger rank;
@property(readonly,nonatomic) NSAttributedString* attributedContents;

+ (NSArray*)validSymbols;

+ (NSArray*)validColors;

+ (NSArray*)validStrokes;

+ (NSArray*)rankStrings;

+ (NSUInteger)maxRank;

@end
