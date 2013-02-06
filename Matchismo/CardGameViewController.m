//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Daniel Sandoval on 02/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastPlayLabel;
@property (weak, nonatomic) IBOutlet UISwitch *threeCardSwitch;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame* game;
@end

@implementation CardGameViewController

- (IBAction)reloadGame:(UIButton *)sender {
    self.game = nil;
    [self updateUI];
}

- (CardMatchingGame*) game {
    if (!_game)
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
}

- (void) setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        self.lastPlayLabel.text = self.game.lastPlay;
    }
    if ([self.game hasPlayableCardFaceUp])
        self.threeCardSwitch.enabled = NO;
    else
        self.threeCardSwitch.enabled = YES;
}

- (IBAction)switchThreeCardMatch:(UISwitch *)sender {
    if (sender.isOn) {
        self.game.numberOfCardsToMatch = 3;
    } else {
        self.game.numberOfCardsToMatch = 2;
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
