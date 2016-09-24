//
//  FullVideoViewViewController.h
//  YoutubeDummy
//
//  Created by Naveen Dungarwal on 24/09/16.
//  Copyright © 2016 Naveen Dungarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

@interface FullVideoViewViewController : UIViewController<YTPlayerViewDelegate>

@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;
@end
