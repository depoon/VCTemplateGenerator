//
//  TemplaceGeneratorViewController.h
//  PGTemplateGenerator
//

#import <Cocoa/Cocoa.h>

@interface TemplaceGeneratorViewController : NSViewController
@property (weak) IBOutlet NSTextField *classNameTextField;
@property (weak) IBOutlet NSTextField *saveToTextField;
@property (weak) IBOutlet NSTextField *successfulLabel;

- (IBAction)onGenerateButtonClicked:(id)sender;
- (IBAction)onBrowseFileButtonClicked:(id)sender;
- (IBAction)onOpenFolderButtonClicked:(id)sender;

@end
