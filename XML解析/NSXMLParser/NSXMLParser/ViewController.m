//
//  ViewController.m
//  NSXMLParser
//
//  Created by apple on 15/10/14.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "ModalObj.h"

@interface ViewController ()
<NSXMLParserDelegate> {
    NSMutableArray *objArray;
    ModalObj       *obj;
    NSMutableString*content;//找到的内容
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   /*
    1. SAX逐行解析
    SAX:SimpleAPIfor XML.基于事件驱动的解析方式,逐行解析数据.
    (采用协议回调机制)
      NSXMLParser是iOS自带的XML解析类.采用SAX方式解析数据
      解析过程由NSXMLParserDelegate协议方法回调
      解析过程:开始标签->取值->结束标签->取值
    
    2. DOM解析
    DOM:DocumentObjectModel(文档对象模型).
    解析时需要将XML文件整体读入,并且将XML结构化成树状,使用时再通过树状结构读取相关数据
    */
    NSString *path = [[NSBundle mainBundle] pathForResource:@"File" ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    /*
     1. 用数据初始化解析类对象
     2. 设置代理self
     3. 开始解析
     */
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    [parser parse];
    
    [parser release];
    parser = nil;
}

/**
 *  开始解析文档
 *
 *  @param parser 解析器对象
 */
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"开始解析");
}

/**
 *  结束解析文档
 *
 *  @param parser 解析器对象
 */
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"结束解析");
    //使用数组中的数据 -- 显示在tableView上 -- 刷新表
    NSLog(@"%@",objArray);
    
}

/**
 *  找到开始标签
 *
 *  @param parser        <#parser description#>
 *  @param elementName   <#elementName description#>
 *  @param namespaceURI  <#namespaceURI description#>
 *  @param qName         <#qName description#>
 *  @param attributeDict <#attributeDict description#>
 */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary*)attributeDict {
    //NSLog(@"找到开始标签--%@",elementName);
    if([elementName isEqualToString:@"notes"]) {
        objArray = [[NSMutableArray alloc] initWithCapacity:0];
        
        content = [[NSMutableString alloc] initWithString:@""];
        
        
    }
    else if([elementName isEqualToString:@"note"]) {
        obj = [ModalObj new];
    }
    //每次找到开始标签前,置空,避免把多个标签的内容拼接到一起
    [content setString:@""];
}

/**
 *  找到结束标签
 *
 *  @param parser       <#parser description#>
 *  @param elementName  <#elementName description#>
 *  @param namespaceURI <#namespaceURI description#>
 *  @param qName        <#qName description#>
 */
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName {
    //NSLog(@"找到结束标签--%@",elementName);
    
    if([elementName isEqualToString:@"to"]) {
        obj.to = content;
    }else if ([elementName isEqualToString:@"from"]) {
        obj.from = content;
    }else if ([elementName isEqualToString:@"heading"]) {
        obj.heading = content;
    }else if ([elementName isEqualToString:@"body"]) {
        obj.body = content;
    }else if ([elementName isEqualToString:@"note"]) {
        [objArray addObject:obj];
        [obj release];
        obj = nil;
    }
}

/**
 *  找到标签内容
 *  注: 可能会调用多次,要拼接起来
 *  @param parser 解析器对象
 *  @param string 找到的内容
 */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"找到内容--%@",string);
    //content = string;
    [content appendString:string];
}

- (void)dealloc {
    [objArray release];
    objArray = nil;
    [content release];
    content = nil;
    [super dealloc];
}

@end
