//
//  ViewController.m
//  DomParser
//
//  Created by apple on 15/10/14.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "ModalObj.h"
#import "GDataXMLNode.h"
#import "XMLDictionary.h"
@interface ViewController () {
    NSMutableArray *objArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    objArray = [NSMutableArray new];
   /*
    ARC和非ARC 混编
    1.在ARC下使用MRC  输入 -fno-objc-arc
    2.在MRC下使用ARC  输入 -fobjc-arc
    */
    NSString *path     = [[NSBundle mainBundle] pathForResource:@"File" ofType:@"xml"];
    NSData *data       = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic  = [NSDictionary dictionaryWithXMLData:data];
    NSArray *noteArray = dic[@"note"];
    for (NSDictionary *dic1 in noteArray) {
        ModalObj *obj = [ModalObj modalWithDictionary:dic1];
        [objArray addObject:obj];
    }
}

- (void)parser {
    /*
     DOM解析:GDataXML
     配置流程
     1. ARC关闭
     2. 添加一个依赖库
     Build Phases添加一个libxml2.***
     3. 在Build Settings
     搜索Header Search Paths
     添加字段  /usr/include/libxml2
     */
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"File" ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
    //1. 根标签  根节点
    GDataXMLElement *rootElement = document.rootElement;
    //2. 获取根节点下的子节点
    NSArray *childArray = rootElement.children;
    //3. 遍历数组,找到每个子节点
    for (GDataXMLElement *obj in childArray) {
        ModalObj *modalObj = [ModalObj new];
        //4. 获取子节点的子节点
        NSArray *array1 = obj.children;
        for (GDataXMLElement *obj1 in array1) {
            if([obj1.name isEqualToString:@"to"]) {
                modalObj.to   = [obj1 stringValue];
            }else if([obj1.name isEqualToString:@"from"]) {
                modalObj.from = [obj1 stringValue];
            }else if([obj1.name isEqualToString:@"heading"]) {
                modalObj.heading = [obj1 stringValue];
            }else if([obj1.name isEqualToString:@"body"]) {
                modalObj.body = [obj1 stringValue];
            }
        }
        [objArray addObject:modalObj];
    }

}

@end
