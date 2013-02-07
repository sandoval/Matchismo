//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Daniel Sandoval on 02/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastPlayLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame* game;
@end
