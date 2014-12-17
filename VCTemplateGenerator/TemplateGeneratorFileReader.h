//
//  TemplateGeneratorFileReader.h
//  PGTemplateGenerator
//

#import <Foundation/Foundation.h>

@interface TemplateGeneratorFileReader : NSObject
- (NSString *) getFileContentWithFileName: (NSString *) fileName className: (NSString *) className;
@end
