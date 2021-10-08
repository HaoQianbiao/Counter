//
//  MModel.h
//  计算器
//
//  Created by haoqianbiao on 2021/9/27.
//

#import <Foundation/Foundation.h>
#define Max 100
NS_ASSUME_NONNULL_BEGIN

@interface MModel : NSObject

typedef struct {
    float data[Max];
    int top;
}numberStack;
typedef struct {
    char data[Max];
    int top;
}operatorStack;
- (float)stringManage:(NSMutableString*) string;
- (int)stringPretreatment:(NSMutableString*) string;

@property int Flag;

@end


NS_ASSUME_NONNULL_END
