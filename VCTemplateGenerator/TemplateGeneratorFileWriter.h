//
//  TemplateGeneratorFileWriter.h
//  PGTemplateGenerator
//

#import <Foundation/Foundation.h>
#import "TemplateDomainObject.h"

@interface TemplateGeneratorFileWriter : NSObject
- (void) writeTemplateDomainObject: (TemplateDomainObject *) domainObject toDestinationFolder: (NSString *) destinationFolder;
@end
