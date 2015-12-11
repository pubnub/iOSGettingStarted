# iOSGettingStarted

1. Create project in Xcode
2. Close project (project must be closed for the following steps)
3. Create Podfile
4. Run `pod install` from command line within project repository
5. Open up newly created workspace (in this case Example.xcworkspace)
6. Navigate to ViewController.m
7. Add `#import <PubNub/PubNub.h>`
8. Add `@property (nonatomic, strong) PubNub *client;`
9. Add `PNObjectEventListener` protocol to ViewController.m
10. Initialize PubNub client instance using your pub and sub keys. Assign it to `self.client` instance variable
11. Register ViewController as a listener for PubNub subscribe callbacks
12. Subscribe to test channel
13. Add label and button properties to ViewController class (declare them as IBOutlets)
14. Update label with message from `- (void)client:(PubNub *)client didReceiveMessage:(PNMessageResult *)message` callback
14. Add IBAction for button. Implementation should publish "Hello, world!" string on same test channel
15. Connect button, label, and action in Main.storyboard
16. Run on sim and click button to see the result!
