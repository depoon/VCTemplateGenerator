//
//  TemplateDomainObjectItemFolder.h
//  PGTemplateGenerator
//

#import "TemplateDomainObjectItem.h"

@interface TemplateDomainObjectItemFolder : TemplateDomainObjectItem
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSMutableArray* listItem;


- (unsigned long) getNItem;
- (TemplateDomainObjectItem *) getItemAtIndex: (unsigned long) index;
- (void) addItem: (TemplateDomainObjectItem *) item;
@end
