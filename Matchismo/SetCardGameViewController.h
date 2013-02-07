//
//  SetCardGameViewController.h
//  Matchismo
//
//  Created by Daniel Sandoval on 07/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import "CardGameViewController.h"
#import "SetCardDeck.h"

@interface SetCardGameViewController : CardGameViewController
@property (strong, nonatomic) CardMatchingGame* game;
@end
