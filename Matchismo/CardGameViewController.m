//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Daniel Sandoval on 02/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) NSUInteger flipCount;
@property (strong, nonatomic) PlayingCardDeck* playingDeck;
@end

@implementation CardGameViewController

- (PlayingCardDeck*) playingDeck {
    if (!_playingDeck) {
        _playingDeck = [[PlayingCardDeck alloc] init];
    }
    return _playingDeck;
}

- (IBAction)flipCard:(UIButton*)sender {
    if (!sender.isSelected) {
        [sender setTitle:[self.playingDeck drawRandomCard].contents forState:UIControlStateSelected];
        self.flipCount++;
    }
    sender.selected = !sender.isSelected;
}

- (void) setFlipCount:(NSUInteger)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
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
