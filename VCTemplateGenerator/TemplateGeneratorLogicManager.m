//
//  TemplateGeneratorLogicManager.m
//  PGTemplateGenerator
//

#import "TemplateGeneratorLogicManager.h"
#import "TemplateGeneratorStructureReader.h"
#import "TemplateDomainObjectGenerator.h"
#import "TemplateDomainObject.h"
#import "TemplateGeneratorFileWriter.h"

@implementation TemplateGeneratorLogicManager

- (void) generateTemplateWithClassName: (NSString *) aClassName destinationFolder: (NSString *) aDestinationFolder {
    self.className = aClassName;
    self.destinationFolder = aDestinationFolder;
    NSLog(@"className = %@", aClassName);
    NSLog(@"destinationFolder = %@", aDestinationFolder);
    
    TemplateGeneratorStructureReader* structureReader = [[TemplateGeneratorStructureReader alloc] init];
    NSDictionary* structureDict = [structureReader retrieveStructureDictionaryFromPlist];
    
    TemplateDomainObjectGenerator* domainObjectGenerator = [[TemplateDomainObjectGenerator alloc] init];
    TemplateDomainObject* domainObject = [domainObjectGenerator generateDomainObjectWithInfo: structureDict className: self.className];
    
    TemplateGeneratorFileWriter* fileWrite = [[TemplateGeneratorFileWriter alloc] init];
    [fileWrite writeTemplateDomainObject: domainObject toDestinationFolder: self.destinationFolder];
}


@end
