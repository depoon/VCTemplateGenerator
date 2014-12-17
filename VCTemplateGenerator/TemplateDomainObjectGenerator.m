//
//  TemplateDomainObjectGenerator.m
//  PGTemplateGenerator
//

#import "TemplateDomainObjectGenerator.h"
#import "TemplateGeneratorFileReader.h"

@implementation TemplateDomainObjectGenerator

- (TemplateDomainObjectItemFile *) generateDomainObjectItemFileWithFileName: (NSString *) fileName className: (NSString *)className{
    TemplateGeneratorFileReader* fileReader = [[TemplateGeneratorFileReader alloc] init];
    NSString* fileContent = [fileReader getFileContentWithFileName: fileName className: className];
    NSString* outputFileName = [fileName stringByReplacingOccurrencesOfString:@"__ClassName__" withString: className];
    
    TemplateDomainObjectItemFile* itemFile = [[TemplateDomainObjectItemFile alloc] init];
    itemFile.name = outputFileName;
    itemFile.content = fileContent;
    
    NSLog(@"content = %@", fileContent);
    return itemFile;
}

- (TemplateDomainObjectItemFile *) generateDomainObjectItemFileWithInfo: (NSDictionary *) infoDict className: (NSString *) className {
    NSString* name = [infoDict objectForKey:@"name"];
    NSString* type = [infoDict objectForKey:@"type"];
    if ([@"file" isEqualToString:type]) {
        return [self generateDomainObjectItemFileWithFileName: name className: className];
    }
    return nil;
}

- (TemplateDomainObjectItem *) generateDomainObjectItemWithInfo: (NSDictionary *) infoDict className: (NSString *) className {
    NSString* type = [infoDict objectForKey:@"type"];
    if ([@"file" isEqualToString:type]) {
        return [self generateDomainObjectItemFileWithInfo: infoDict className: className];
    }
    else if ([@"folder" isEqualToString:type]){
        return [self generateDomainObjectItemFolderWithInfo:infoDict className: className];
    }
    return nil;
}

- (TemplateDomainObjectItemFolder *) generateDomainObjectItemFolderWithInfo: (NSDictionary *) infoDict className: (NSString *) className {
    TemplateDomainObjectItemFolder* folder = [[TemplateDomainObjectItemFolder alloc] init];
    NSString* name = [infoDict objectForKey:@"name"];
    folder.name = [name stringByReplacingOccurrencesOfString: @"__ClassName__" withString: className];
    
    NSString* type = [infoDict objectForKey:@"type"];
    if ([@"folder" isEqualToString:type]) {
        NSArray* listItem = [infoDict objectForKey:@"items"];
        for (NSDictionary* itemDict in listItem) {
            TemplateDomainObjectItem * item = [self generateDomainObjectItemWithInfo: itemDict className: className];
            [folder addItem: item];
        }
        return folder;
    }
    return nil;
}

- (TemplateDomainObject *) generateDomainObjectWithInfo: (NSDictionary *) infoDict className: (NSString *) className {
    TemplateDomainObject* domainObject = [[TemplateDomainObject alloc] init];
    domainObject.className = className;
    TemplateDomainObjectItemFolder* folder = [self generateDomainObjectItemFolderWithInfo: infoDict className: className];
    domainObject.topFolder = folder;
    return domainObject;
}
@end
