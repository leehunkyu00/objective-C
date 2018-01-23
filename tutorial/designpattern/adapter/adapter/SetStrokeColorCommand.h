//
//  SetStrokeColorCommand.h
//  adapter
//
//  Created by hklee on 2018. 1. 18..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "Command.h"

@class SetStrokeColorCommand;

@protocol SetStrokeColorCommandDelegate

    - (void) command:(SetStrokeColorCommand *)command
        didFinishColorUpdateWithColor:(UIColor *) color;

@end


@interface SetStrokeColorCommand : Command
    @private
    id <SetStrokeColorCommandDelegate> delegate_;
    @property (nonatomic, assign) id <SetStrokeColorCommandDelegate> delegate;
    - (void) execute;
@end
