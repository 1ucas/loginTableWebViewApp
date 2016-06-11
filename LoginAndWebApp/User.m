//
//  User.m
//  LoginAndWebApp
//
//  Created by Lucas Maciel on 6/11/16.
//  Copyright © 2016 Lucas Maciel. All rights reserved.
//

#import "User.h"

@implementation User

-(NSDictionary*)toDictionary{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:self.username forKey:@"username"];
    [dictionary setObject:self.password forKey:@"password"];
    return dictionary;
}

+(User*)userfromDictionary:(NSDictionary*)userDict{
    User* user = [[User alloc] init];
    user.username = [userDict objectForKey:@"username"];
    user.password = [userDict objectForKey:@"password"];
    return user;
}

+(NSArray*)listFromDictionaries:(NSArray*)dictArray{
    NSMutableArray *userArray = [[NSMutableArray alloc] init];
    for (NSDictionary* dict in dictArray) {
        [userArray addObject:[User userfromDictionary:dict]];
    }
    return userArray;
}

+(NSArray*)toDictionaryList:(NSArray*)userArray{
    NSMutableArray *dictArray = [[NSMutableArray alloc] init];
    for (User* user in userArray) {
        [dictArray addObject: [user toDictionary]];
    }
    return dictArray;
}

@end
