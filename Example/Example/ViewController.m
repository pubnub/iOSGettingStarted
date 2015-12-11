//
//  ViewController.m
//  Example
//
//  Created by Jordan Zucker on 12/9/15.
//  Copyright © 2015 pubnub. All rights reserved.
//

#import <PubNub/PubNub.h>
#import "ViewController.h"

@interface ViewController () <PNObjectEventListener>
@property (nonatomic, strong) PubNub *client;
@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, weak) IBOutlet UIButton *button;
- (IBAction)buttonTapped:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.client = [PubNub clientWithConfiguration:[PNConfiguration configurationWithPublishKey:@"demo" subscribeKey:@"demo"]];
    [self.client addListener:self];
    [self.client subscribeToChannels:@[@"testing"] withPresence:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    [self.client publish:@"Hello, world!" toChannel:@"testing" withCompletion:nil];
}

#pragma mark - PNObjectEventListener

- (void)client:(PubNub *)client didReceiveMessage:(PNMessageResult *)message {
    self.label.text = message.data.message;
}

@end
