//
//  PNAPixelSounds.h
//  PixelNOise
//
//  Created by Derek Weber on 5/5/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface PNAPixelSounds : NSObject

@property (nonatomic) AVAudioPlayer *player;

//This is an INSTANCE method b/c of the - sign before the (void)
-(void)playSoundWithName: (NSString *)soundName;


@end
