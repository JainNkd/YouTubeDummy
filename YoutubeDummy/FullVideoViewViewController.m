//
//  FullVideoViewViewController.m
//  YoutubeDummy
//
//  Created by Naveen Dungarwal on 24/09/16.
//  Copyright © 2016 Naveen Dungarwal. All rights reserved.
//

#import "FullVideoViewViewController.h"

@interface FullVideoViewViewController ()

@end

@implementation FullVideoViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *videoId = @"gHy747iC3Cw";
    
    
    // For a full list of player parameters, see the documentation for the HTML5 player
    // at: https://developers.google.com/youtube/player_parameters?playerVersion=HTML5
    NSDictionary *playerVars = @{
                                 @"autoplay" : @1,
                                 @"playsinline" : @1,
                                 @"showinfo" : @0,
                                 @"rel" : @0,
                                 @"modestbranding" : @1,
                                 @"controls" : @1,
                                 @"fs": @1,
                                 };
    self.playerView.delegate = self;
    [self.playerView loadWithVideoId:videoId playerVars:playerVars];
    
    
    
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(receivedPlaybackStartedNotification:)
//                                                 name:@"Playback started"
//                                               object:nil];
}

//- (void)receivedPlaybackStartedNotification:(NSNotification *) notification {
//    if([notification.name isEqual:@"Playback started"] && notification.object != self) {
//        [self.playerView pauseVideo];
//    }
//}
//
-(void)playerViewDidBecomeReady:(YTPlayerView *)playerView
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Playback started" object:self]; [self.playerView playVideo]; }

-(void)playerView:(YTPlayerView *)playerView receivedError:(YTPlayerError)error
{
    
}

-(void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state
{
    NSLog(@"Video Play done...%ld",(long)state);
    if(state == kYTPlayerStateEnded)
    {
        NSLog(@"Video Play done");
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
