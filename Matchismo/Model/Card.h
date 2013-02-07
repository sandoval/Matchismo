//
//  Card.h
//  Matchismo
//
//  Created by Daniel Sandoval on 03/02/2013.
//  Copyright (c) 2013 LoopEC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(readonly,nonatomic) NSAttributedString* attributedContents;

@property(strong,nonatomic) NSString* contents;

@property (nonatomic, getter = isFaceUp) BOOL faceUp;

@property (nonatomic, getter = isUnplayable) BOOL unplayable;

- (int) match:(NSArray*)otherCards;

@end