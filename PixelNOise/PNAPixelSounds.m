//
//  PNAPixelSounds.m
//  PixelNOise
//
//  Created by Derek Weber on 5/5/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "PNAPixelSounds.h"

@implementation PNAPixelSounds


-(void)playSoundWithName:(NSString *)soundName
{
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    
    NSData *fileData = [NSData dataWithContentsOfFile:file];
                        
    self.player = [[AVAudioPlayer alloc]initWithData:fileData error:nil];
    
    [self.player play];
                        
                        
}

@end
