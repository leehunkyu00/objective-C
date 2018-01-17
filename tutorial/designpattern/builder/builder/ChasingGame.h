//
//  ChasingGame.h
//  builder
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StandardCharacterBuilder.h"

@interface ChasingGame : NSObject
{
    
}

- (Character *) createPlayer:(CharacterBuilder *) builder;
- (Character *) createEnemy:(CharacterBuilder *) builder;


@end
