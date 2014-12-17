//
//  TemplateDomainObject.h
//  PGTemplateGenerator
//

#import <Foundation/Foundation.h>
#import "TemplateDomainObjectItemFolder.h"

@interface TemplateDomainObject : NSObject
@property (nonatomic, strong) NSString* className;
@property (nonatomic, strong) TemplateDomainObjectItemFolder* topFolder;
@end
