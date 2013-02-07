//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by Daniel Sandoval on 07/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import "SetCardGameViewController.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController
@synthesize game = _game;

- (CardMatchingGame*) game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[super.cardButtons count]
                                                  usingDeck:[[SetCardDeck alloc] initWithCards:[super.cardButtons count]]];
        _game.numberOfCardsToMatch = 3;
    }
    return _game;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
