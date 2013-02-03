//
//  Card.m
//  Matchismo
//
//  Created by Daniel Sandoval on 03/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray*)otherCards {
    int score = 0;
    
    for(Card* card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
            break;
        }
    }
    
    return score;
}

@end