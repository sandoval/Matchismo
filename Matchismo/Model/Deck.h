//
//  Deck.h
//  Matchismo
//
//  Created by Daniel Sandoval on 03/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void) addCard:(Card*)card atTop:(BOOL)atTop;
- (Card*) drawRandomCard;
@end
