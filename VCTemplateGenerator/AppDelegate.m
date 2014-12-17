//
//  AppDelegate.m
//  PGTemplateGenerator
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.templateGeneratorViewController = [[TemplaceGeneratorViewController alloc] initWithNibName:@"TemplaceGeneratorViewController" bundle: nil];
    [self.window.contentView addSubview: self.templateGeneratorViewController.view];
    self.templateGeneratorViewController.view.frame = [((NSView*) self.window.contentView) bounds];
}

@end
