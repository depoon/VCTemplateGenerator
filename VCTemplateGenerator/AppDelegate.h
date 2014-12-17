//
//  AppDelegate.h
//  PGTemplateGenerator
//
//

#import <Cocoa/Cocoa.h>
#import "TemplaceGeneratorViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, strong) TemplaceGeneratorViewController* templateGeneratorViewController;

@end
