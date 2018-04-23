//
//  main.m
//  NSString
//
//  Created by Dmitriy Tarelkin on 18/4/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "StringConverter.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        StringConverter* firstString = [[StringConverter alloc] initWithText:@"Prime Minister <Narendra Modi> tweeted a <link> to the speech (Human Resource Development Minister Smriti Irani) <made> in the Lok Sabha during the ((debate) on the ongoing JNU row) and the suicide of Dalit scholar Rohith Vemula at the [Hyderabad Central University]."]; //inits with text
        
        NSLog(@"%@",firstString);
        [firstString release];
        
        //second text
        
        
        StringConverter* secondSrting = [[StringConverter alloc] initWithText:@"Lorem <(ipsum [dolor <sit] amet), consectetur adipiscing elit>. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet>. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget (nulla. Class aptent <taciti [sociosqu ad] litora torquent per conubia> nostra), per inceptos himenaeos."];
        
        NSLog(@"%@",secondSrting);
        
        
        [secondSrting release];
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
