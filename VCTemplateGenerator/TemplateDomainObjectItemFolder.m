//
//  TemplateDomainObjectItemFolder.m
//  PGTemplateGenerator
//

#import "TemplateDomainObjectItemFolder.h"

@implementation TemplateDomainObjectItemFolder
- (instancetype) init {
    self = [super init];
    _listItem = [[NSMutableArray alloc] init];
    return  self;
}

- (unsigned long) getNItem {
    return [self.listItem count];
}

- (TemplateDomainObjectItem *) getItemAtIndex: (unsigned long) index {
    return [self.listItem objectAtIndex: index];
}

- (void) addItem: (TemplateDomainObjectItem *) item {
    [self.listItem addObject: item];
}

@end
