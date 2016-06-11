//
//  User.h
//  LoginAndWebApp
//
//  Created by Lucas Maciel on 6/11/16.
//  Copyright © 2016 Lucas Maciel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;

-(NSDictionary*)toDictionary;
+(User*)userfromDictionary:(NSDictionary*)userDict;
+(NSArray*)listFromDictionaries:(NSArray*)dictArray;
+(NSArray*)toDictionaryList:(NSArray*)userArray;

@end
