//
//  TemplaceGeneratorViewController.m
//  PGTemplateGenerator
//

#import "TemplaceGeneratorViewController.h"
#import "TemplateGeneratorLogicManager.h"

@interface TemplaceGeneratorViewController ()

@end

@implementation TemplaceGeneratorViewController {
    TemplateGeneratorLogicManager* logicManager;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        logicManager = [[TemplateGeneratorLogicManager alloc] init];
    }
    return self;
}

- (IBAction)onGenerateButtonClicked:(id)sender {
    NSLog (@"onGenerateButtonClicked");
    [self.successfulLabel setHidden: YES];

    NSString* className = [self.classNameTextField stringValue];
    NSString* destinationFolder = [self.saveToTextField stringValue];
    if ([className length] == 0) {
        NSAlert* alert = [NSAlert alertWithMessageText:@"Please enter class name" defaultButton:@"OK" alternateButton:@"" otherButton:@"" informativeTextWithFormat:@""];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert beginSheetModalForWindow:self.view.window completionHandler: nil];
    }
    else if ([destinationFolder length] == 0) {
        NSAlert* alert = [NSAlert alertWithMessageText:@"Please choose a destination folder to save file" defaultButton:@"OK" alternateButton:@"" otherButton:@"" informativeTextWithFormat:@""];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert beginSheetModalForWindow:self.view.window completionHandler: nil];
    }
    else {
        [logicManager generateTemplateWithClassName:className destinationFolder: destinationFolder];
        [self.successfulLabel setHidden: NO];
    }
}


- (IBAction)onBrowseFileButtonClicked:(id)sender {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:NO];
    [panel setCanChooseDirectories:YES];
    [panel setAllowsMultipleSelection:NO]; // yes if more than one dir is allowed
    
    NSInteger clicked = [panel runModal];
    
    if (clicked == NSFileHandlingPanelOKButton) {
        for (NSURL *url in [panel URLs]) {
            [self.saveToTextField setStringValue: url.path];
        }
    }
}

- (IBAction)onOpenFolderButtonClicked:(id)sender {
    NSString* folderToOpen = self.saveToTextField.stringValue;
    if ([folderToOpen length] > 0) {
        NSURL * folderUrl = [NSURL fileURLWithPath: folderToOpen];
        [[NSWorkspace sharedWorkspace] openURL: folderUrl];
    }
}
@end
