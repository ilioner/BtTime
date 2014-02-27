//
//  BTTIMEConstans.h
//  BtTime
//
//  Created by zql on 14-2-25.
//  Copyright (c) 2014年 zql. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifndef __OPTIMIZE__
#define NSLog(...) {printf("Method is %s_______Line number is %d->",__func__, __LINE__); NSLog(__VA_ARGS__);}
#else
#define NSLog(...) {}
#endif

@interface BTTIMEConstans : NSObject

@end
