//
//  ModalObj.m
//  NSXMLParser
//
//  Created by apple on 15/10/14.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ModalObj.h"

@implementation ModalObj

//将来在打印对象的时候,内容就是这个方法的内容
- (NSString *)description {
    return [NSString stringWithFormat:@"%@--%@--%@--%@",self.to,self.from,self.heading,self.body];
}

+ (id)modalWithDictionary:(NSDictionary *)dic {
    return [[self alloc] initWithDictionary:dic];
}
- (id)initWithDictionary :(NSDictionary *)dic {
    self = [super init];
    if (self) {
        ModalObj *obj = [ModalObj new];
        obj.to = dic[@"to"];
        obj.from = dic[@"from"];
        obj.heading = dic[@"heading"];
        obj.body = dic[@"body"];
    }
    return self;
}

@end









