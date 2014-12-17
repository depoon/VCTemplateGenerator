//
//  TemplateGeneratorLogicManager.h
//  PGTemplateGenerator
//

#import <Foundation/Foundation.h>

@interface TemplateGeneratorLogicManager : NSObject
@property (nonatomic, strong) NSString* className;
@property (nonatomic, strong) NSString* destinationFolder;

- (void) generateTemplateWithClassName: (NSString *) _className destinationFolder: (NSString *) _destinationFolder;
@end
