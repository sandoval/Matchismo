//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Daniel Sandoval on 02/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@end

@implementation CardGameViewController

- (IBAction)reloadGame:(UIButton *)sender {
    self.game = nil;
    [self updateUI];
}


- (void) setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setAttributedTitle:card.attributedContents forState:UIControlStateSelected];
        [cardButton setAttributedTitle:card.attributedContents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        self.lastPlayLabel.attributedText = self.game.attributedLastPlay;
    }
}

- (IBAction)flipCard:(UIButton*)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
