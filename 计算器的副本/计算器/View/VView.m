//
//  VView.m
//  计算器
//
//  Created by haoqianbiao on 2021/9/27.
//

#import "VView.h"
#import "Masonry.h"
#define H self.bounds.size.height
#define W self.bounds.size.width
#define w (W / 5 + 5)
@implementation VView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor blackColor];
    
    _textField = [[UITextField alloc] init];
    [self addSubview:_textField];
    _textField.backgroundColor = [UIColor blackColor];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(280);
        make.right.equalTo(self).offset(-40);
        make.height.equalTo(@(H/9));
        make.width.equalTo(@(W));
    }];
    _textField.textColor = [UIColor whiteColor];
    _textField.font = [UIFont systemFontOfSize:55];
    _textField.textAlignment = NSTextAlignmentRight;
    _textField.tintColor = [UIColor clearColor];
    
    _buttonZero = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonZero.tag = 0;
    [self addSubview:_buttonZero];
    _buttonOne = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonOne.tag = 1;
    [self addSubview:_buttonOne];
    _buttonTwo = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonTwo.tag = 2;
    [self addSubview:_buttonTwo];
    _buttonThree = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonThree.tag = 3;
    [self addSubview:_buttonThree];
    _buttonAdd = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonAdd.tag = 102;
    [self addSubview:_buttonAdd];
    _buttonFour = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonFour.tag = 4;
    [self addSubview:_buttonFour];
    _buttonFive = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonFive.tag = 5;
    [self addSubview:_buttonFive];
    _buttonSix = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonSix.tag = 6;
    [self addSubview:_buttonSix];
    _buttonSubtract = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonSubtract.tag = 103;
    [self addSubview:_buttonSubtract];
    _buttonSeven = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonSeven.tag = 7;
    [self addSubview:_buttonSeven];
    _buttonEight = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonEight.tag = 8;
    [self addSubview:_buttonEight];
    _buttonNine = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonNine.tag = 9;
    [self addSubview:_buttonNine];
    _buttonPoint = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonPoint.tag = 101;
    [self addSubview:_buttonPoint];
    _buttonEqual = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonEqual.tag = 100;
    [self addSubview:_buttonEqual];
    _buttonMultiply = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonMultiply.tag = 104;
    [self addSubview:_buttonMultiply];
    _buttonDivide = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonDivide.tag = 105;
    [self addSubview:_buttonDivide];
    _buttonRight = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonRight.tag = 106;
    [self addSubview:_buttonRight];
    _buttonLeft = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonLeft.tag = 107;
    [self addSubview:_buttonLeft];
    _buttonDelete = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonDelete.tag = 109;
    [self addSubview:_buttonDelete];
    
    _buttonArray = [[NSArray alloc] initWithObjects:_buttonDelete, _buttonLeft, _buttonRight, _buttonDivide, _buttonSeven, _buttonEight, _buttonNine, _buttonMultiply, _buttonFour, _buttonFive, _buttonSix, _buttonSubtract, _buttonOne, _buttonTwo, _buttonThree, _buttonAdd, _buttonZero, _buttonPoint, _buttonEqual,nil];
    
    _contentArray = [[NSArray alloc] initWithObjects:@"AC", @"(", @")", @"/", @"7", @"8", @"9", @"*", @"4", @"5", @"6", @"-", @"1", @"2", @"3", @"+", @"0", @".", @"=", nil];
    
    for (int i = 0; i < 5; i++) {
        if (i < 4) {
            for (int j = 0; j < 4; j++) {
                UIButton* button = [[UIButton alloc] init];
                button = [_buttonArray objectAtIndex:4 * i + j];
                if (j < 3 && i > 0) {
                    button.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.6];
                } else if (j == 3) {
                    button.backgroundColor = [UIColor orangeColor];
                } else if (i == 0 && j < 3) {
                    button.backgroundColor = [UIColor grayColor];
                }
                button.layer.cornerRadius =  w / 2;
                NSString* string = [_contentArray objectAtIndex:4 * i +j];
                [button setTitle:string forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:40];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                                make.bottom.equalTo(self).offset(- H / 9 * (4 - i) - 40);
                                make.left.equalTo(self).offset( (W - 20) / 4 * j + 10);
                                make.height.equalTo(@(w));
                                make.width.equalTo(@(w));
                }];
            }
        } else {
            for (int j = 0; j < 3; j++) {
                UIButton* button = [[UIButton alloc] init];
                button = [_buttonArray objectAtIndex:j + 16];
                button.layer.cornerRadius =  w / 2;
                NSString* string = [_contentArray objectAtIndex:j + 16];
                [button setTitle:string forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:40];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                if (j == 0) {
                    button.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.6];
                    [button mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.bottom.equalTo(_buttonOne).offset(H / 9);
                        make.left.equalTo(self).offset(10);
                        make.width.equalTo(@(2 * w));
                        make.height.equalTo(@w);
                    }];
                } else {
                    if (j == 1) {
                        button.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.6];
                    } else {
                        button.backgroundColor = [UIColor orangeColor];
                    }
                    [button mas_makeConstraints:^(MASConstraintMaker *make) {
                                    make.bottom.equalTo(_buttonOne).offset(H / 9);
                                    make.left.equalTo(self).offset( (W - 20) / 4 * (j + 1) + 10);
                                    make.height.equalTo(@(w));
                                    make.width.equalTo(@(w));
                    }];
                }
            }
        }
    }
    return self;
    
}

@end
