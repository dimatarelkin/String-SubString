//
//  StringConverter.m
//  NSString
//
//  Created by Dmitriy Tarelkin on 19/4/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "StringConverter.h"
typedef void(^converterBlock)(NSString*, NSString*);

@interface StringConverter ()

@property (retain,nonatomic) NSMutableArray* printArray;
@end



@implementation StringConverter

#pragma mark - Overriding

- (void)setText:(NSString *)text {
    
    //if we want to change our current text
    [text retain];
    [_text release];
    _text = text;
}

- (instancetype)initWithText:(NSString*)inputText {
    
    self = [super init];
    
    if (self) {
        [inputText retain];
        _text = inputText;
        
        _printArray = [NSMutableArray array];
        
        NSLog(@"%lu",(unsigned long)_text.length);
        [self output];
    }
    
    return self;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@", [ self.printArray componentsJoinedByString:@" ✅ "]];
}



#pragma mark - Logic
- (NSMutableArray *)output {
    
    
    NSDictionary* openTagsDict = @{ [NSNumber numberWithChar:'(']: [NSMutableArray array],
                                [NSNumber numberWithChar:'<']: [NSMutableArray array],
                                [NSNumber numberWithChar:'[']: [NSMutableArray array],
                               };
    
    NSDictionary* closeTagDict = @{ [NSNumber numberWithChar:')']: [NSNumber numberWithChar:'('],
                                [NSNumber numberWithChar:'>']: [NSNumber numberWithChar:'<'],
                                [NSNumber numberWithChar:']']: [NSNumber numberWithChar:'['],
                                };

    
    
    for (int i = 0; i < _text.length; i+=1) {
        
        NSNumber* currentCharacter = [NSNumber numberWithChar:[_text characterAtIndex:i]];
        
        //is our current char equal to '(' or '<' or '['
        if ([openTagsDict.allKeys containsObject:currentCharacter]) {
            
            //if it's contains put number into openTags value: [MutableArray array]
            [[openTagsDict objectForKey:currentCharacter] addObject:[NSNumber numberWithInteger:i+1]];
            
            
        } else if ([closeTagDict.allKeys containsObject:currentCharacter]) {
            //if char is a close tag
            
            //get open tag by key of close tag
            NSNumber* openBrace = [closeTagDict objectForKey:currentCharacter];
            
            //get array-value lastObject from openTagsDict and save it like position
            NSInteger currentPosition = [[[openTagsDict objectForKey:openBrace] lastObject] integerValue];
            
            //making substring range
            NSRange rangeOfSubstring = NSMakeRange(currentPosition, i - currentPosition);
            //location = position, length = i - position
            
            
            //put sentence into array
            [_printArray addObject:[_text substringWithRange:rangeOfSubstring]];
            
            
            //remove closingBrace character from mutable array
            [[openTagsDict objectForKey:openBrace] removeLastObject];
        }
    }
    
    
    return _printArray;
}


- (void)dealloc {
    [_text release];
    [_printArray release];
    [super dealloc];
}

@end





////////////////////////////////////////////////////////////////////////
// MY NON-WORKING IDEA :(
////////////////////////////////////////////////////////////////////////


/*
-(NSMutableArray*)methodWithBlock {

    NSString* subString = _text;
    
    converterBlock convert = ^(NSString* openTag, NSString* closeTag) {

        NSRange search = NSMakeRange(0, subString.length); //search loacation = 0
        while (YES) {
            NSRange openTagRange = [subString rangeOfString:openTag options:NSCaseInsensitiveSearch range:search];

            if (openTagRange.location != NSNotFound) {

                NSRange endRange;
                endRange.location = openTagRange.length + openTagRange.location;
                endRange.length = [subString length] - endRange.location;
                endRange = [subString rangeOfString:closeTag options:NSCaseInsensitiveSearch range:endRange];

                if (endRange.location != NSNotFound) {

                    openTagRange.location += openTagRange.length;
                    openTagRange.length = endRange.location - openTagRange.location;

                    NSInteger index = endRange.location + endRange.length;
                    search.location = endRange.location;
                    search.length = (NSInteger)[subString length] - index;

                    NSLog(@"%@", [subString substringWithRange:openTagRange]);


                    [_printArray addObject:[subString substringWithRange:openTagRange]];

                } else {
                    break;
                }
            } else {
                break;
            }
        }
    //block ends

    convert(@"<",@">");
    convert(@"(",@")");
    convert(@"[",@"]");
    };
    return  _printArray;
}
*/

//    NSString *regExString = @"\\(.+\\) | \\<.+\\> | \\[.+\\]";
//    NSRegularExpression *_regEx = [NSRegularExpression regularExpressionWithPattern:regExString options:NSRegularExpressionCaseInsensitive error:nil];

//    NSLog(@"%@",[_regEx stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:@","]);
//
//    //NSLog(@"%@", [_regEx matchesInString:string options:0 range:NSMakeRange(0, string.length)]);
