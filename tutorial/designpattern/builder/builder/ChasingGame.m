//
//  ChasingGame.m
//  builder
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ChasingGame.h"

@implementation ChasingGame

- (Character *) createPlayer:(CharacterBuilder *) builder {
    [builder buildNewCharacter];
    [builder buildStrength:50.0];
    [builder buildStamina:25.0];
    [builder buildIntellingence:75.0];
    [builder buildAgility:65.0];
    [builder buildAggressiveness:35.0];
    
    return [builder character];
}

- (Character *) createEnemy:(CharacterBuilder *) builder {
    
    [builder buildNewCharacter];
    [builder buildStrength:80.0];
    [builder buildStamina:40.0];
    [builder buildIntellingence:45.0];
    [builder buildAgility:25.0];
    [builder buildAggressiveness:95.0];
    
    return [builder character];
}
@end
