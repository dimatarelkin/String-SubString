//
//  StringConverter.h
//  NSString
//
//  Created by Dmitriy Tarelkin on 19/4/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringConverter : NSObject

@property (retain, nonatomic) NSString* text;
- (instancetype)initWithText:(NSString*)text;
- (NSMutableArray*)output;


@end
