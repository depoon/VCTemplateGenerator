//
//  TemplateDomainObjectGenerator.h
//  PGTemplateGenerator
//

#import <Foundation/Foundation.h>
#import "TemplateDomainObjectItemFolder.h"
#import "TemplateDomainObjectItemFile.h"
#import "TemplateDomainObjectItem.h"
#import "TemplateDomainObject.h"

@interface TemplateDomainObjectGenerator : NSObject
- (TemplateDomainObjectItemFile *) generateDomainObjectItemFileWithFileName: (NSString *) fileName className: (NSString *) className;
- (TemplateDomainObjectItemFile *) generateDomainObjectItemFileWithInfo: (NSDictionary *) infoDict className: (NSString *) className;
- (TemplateDomainObjectItem *) generateDomainObjectItemWithInfo: (NSDictionary *) infoDict className: (NSString *) className;
- (TemplateDomainObjectItemFolder *) generateDomainObjectItemFolderWithInfo: (NSDictionary *) infoDict className: (NSString *) className;
- (TemplateDomainObject *) generateDomainObjectWithInfo: (NSDictionary *) infoDict className: (NSString *) className;
@end
