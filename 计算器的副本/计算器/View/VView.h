//
//  VView.h
//  计算器
//
//  Created by haoqianbiao on 2021/9/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VView : UIView
@property (nonatomic, strong) UIButton* buttonZero;
@property (nonatomic, strong) UIButton* buttonOne;
@property (nonatomic, strong) UIButton* buttonTwo;
@property (nonatomic, strong) UIButton* buttonThree;
@property (nonatomic, strong) UIButton* buttonFour;
@property (nonatomic, strong) UIButton* buttonFive;
@property (nonatomic, strong) UIButton* buttonSix;
@property (nonatomic, strong) UIButton* buttonSeven;
@property (nonatomic, strong) UIButton* buttonEight;
@property (nonatomic, strong) UIButton* buttonNine;
@property (nonatomic, strong) UIButton* buttonPoint;
@property (nonatomic, strong) UIButton* buttonEqual;
@property (nonatomic, strong) UIButton* buttonAdd;
@property (nonatomic, strong) UIButton* buttonSubtract;
@property (nonatomic, strong) UIButton* buttonMultiply;
@property (nonatomic, strong) UIButton* buttonDivide;
@property (nonatomic, strong) UIButton* buttonLeft;
@property (nonatomic, strong) UIButton* buttonRight;
@property (nonatomic, strong) UIButton* buttonDelete;
@property (nonatomic, strong) UITextField* textField;

@property (nonatomic, copy) NSArray* buttonArray;
@property (nonatomic, copy) NSArray* contentArray;

@end

NS_ASSUME_NONNULL_END
