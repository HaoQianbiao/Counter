//
//  ViewController.h
//  计算器
//
//  Created by haoqianbiao on 2021/9/27.
//

#import <UIKit/UIKit.h>
#import "MModel.h"
#import "VView.h"


@interface ViewController : UIViewController
@property (nonatomic, strong) VView* myView;
@property (nonatomic, strong) MModel* myModel;
@property (nonatomic, strong) NSMutableString* inputString;
- (NSMutableString*)removeFloatAllZeroByString:(NSMutableString *)testNumber;
@end

