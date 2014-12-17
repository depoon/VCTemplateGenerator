//
//  TemplateGeneratorStructureReader.m
//  PGTemplateGenerator
//

#import "TemplateGeneratorStructureReader.h"

@implementation TemplateGeneratorStructureReader

- (NSDictionary *) retrieveStructureDictionaryFromPlist {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TemplateStructure" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    return dict;
}

@end
