//
//  TemplateGeneratorFileWriter.m
//  PGTemplateGenerator
//

#import "TemplateGeneratorFileWriter.h"
#import "TemplateDomainObjectItem.h"
#import "TemplateDomainObjectItemFile.h"
#import "TemplateDomainObjectItemFolder.h"

@implementation TemplateGeneratorFileWriter
- (void) writeTemplateDomainObject: (TemplateDomainObject *) domainObject toDestinationFolder: (NSString *) destinationFolder {
    TemplateDomainObjectItemFolder* folder = domainObject.topFolder;
    [self createFileOrFolderForItem: folder atPath: destinationFolder];
}

- (void) createFileOrFolderForItem: (TemplateDomainObjectItem *) item atPath: (NSString *) path{
    if ([item isKindOfClass:[TemplateDomainObjectItemFile class]]) {
        TemplateDomainObjectItemFile* itemFile = (TemplateDomainObjectItemFile *) item;
        NSString* filePath = [NSString stringWithFormat:@"%@/%@", path, itemFile.name];
        [self createFileAtPath: filePath withContent: itemFile.content];
    }
    else {
        TemplateDomainObjectItemFolder* itemFolder = (TemplateDomainObjectItemFolder *) item;
        NSString* folderPath = [NSString stringWithFormat:@"%@/%@", path, itemFolder.name];
        [self createFolderAtPath: folderPath];
        
        for (int i = 0; i < [itemFolder getNItem]; i++) {
            TemplateDomainObjectItem* childItem = [itemFolder getItemAtIndex: i];
            [self createFileOrFolderForItem: childItem atPath: folderPath];
        }
    }
}

- (void) createFolderAtPath: (NSString *) path {
    NSFileManager *fileManager= [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath: path withIntermediateDirectories:YES attributes:nil error:NULL];
}

- (void) createFileAtPath: (NSString *) path withContent: (NSString *) content {
    NSFileManager *fileManager= [NSFileManager defaultManager];
    NSData* data = [content dataUsingEncoding: NSUTF8StringEncoding];
    [fileManager createFileAtPath: path contents: data attributes: nil];
}

@end
