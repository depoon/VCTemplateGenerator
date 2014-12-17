//
//  TemplateGeneratorFileReader.m
//  PGTemplateGenerator
//

#import "TemplateGeneratorFileReader.h"

@implementation TemplateGeneratorFileReader

- (NSString *) getFileContentWithFileName: (NSString *) fileName className: (NSString *) className {
    NSString* path = [[NSBundle mainBundle] pathForResource: fileName ofType: @"vctemplate"];
    NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error: NULL];
    content = [content stringByReplacingOccurrencesOfString:@"__ClassName__" withString:className];
    return content;
}

@end
