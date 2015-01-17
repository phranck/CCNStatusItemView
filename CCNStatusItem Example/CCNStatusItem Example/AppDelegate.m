//
//  Created by Frank Gregor on 28.12.14.
//  Copyright (c) 2014 cocoa:naut. All rights reserved.
//

#import "AppDelegate.h"
#import "CCNStatusItem.h"
#import "CCNStatusItemWindowAppearance.h"
#import "ContentViewController.h"


@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSButton *enableDisableCheckbox;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    CCNStatusItemWindowAppearance *appearance = [CCNStatusItemWindowAppearance defaultAppearance];
//    style.backgroundColor = [NSColor colorWithCalibratedRed:0.577 green:0.818 blue:0.130 alpha:1.000];
//    style.cornerRadius = 115.0;
    appearance.presentationTransition = CCNPresentationTransitionSlideAndFade;
    [CCNStatusItem setWindowAppearance:appearance];

    [CCNStatusItem presentStatusItemWithImage:[NSImage imageNamed:@"statusbar-icon"]
                        contentViewController:[[ContentViewController alloc] initWithNibName:NSStringFromClass([ContentViewController class]) bundle:nil]];
}

- (IBAction)enableDisableCheckboxAction:(id)sender {
    [CCNStatusItem sharedInstance].appearsDisabled = (self.enableDisableCheckbox.state == NSOnState);
}

@end