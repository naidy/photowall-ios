//
//  RestClient.h
//  photowall
//
//  Created by student on 2017/5/12.
//  Copyright © 2017年 naidy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestRequest.h"

@interface RestClient : NSObject

- (RestRequest*) path:(NSString*)path;

@end
