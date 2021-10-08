//
//  ViewController.m
//  计算器
//
//  Created by haoqianbiao on 2021/9/27.
//

#import "ViewController.h"
#import "MModel.h"
#import "VView.h"


@interface ViewController ()

@end

@implementation ViewController

int flag = 0;
int Flag = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _inputString = [NSMutableString stringWithFormat:@""];
    
    _myView = [[VView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    for (UIButton* button in _myView.buttonArray) {
        [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    }
    
   
    [self.view addSubview:_myView];
    _myModel = [[MModel alloc] init];
    
}
- (void) press:(UIButton *)button {
    if (button.tag == 106) {
        
        if ([_inputString length] > 0) {
            char ch = [_inputString characterAtIndex:[_inputString length] - 1];
            if (ch == '.' || ch == '+' || ch == '-' || ch == '*' || ch == '/') {
                
            } else {
                [_inputString appendFormat:@")"];
            }
        } else {
            
        }
    } else if (button.tag == 107) {
        
        if ([_inputString length] > 0) {
            char ch = [_inputString characterAtIndex:[_inputString length] - 1];
            if ((ch >= '0' && ch <= '9') || ch == '.') {
            } else {
                [_inputString appendFormat:@"("];
            }
        } else {
            [_inputString appendFormat:@"("];
        }
        
    } else if (button.tag == 103) {
        if ([_inputString length] == 0) {
            [_inputString appendFormat:@"0-"];
        } else {
            char ch = [_inputString characterAtIndex:[_inputString length] - 1];
            if (ch == '+' || ch == '*' || ch == '/' || ch == '-') {
            [_inputString replaceCharactersInRange:NSMakeRange([_inputString length] - 1, 1) withString:@"-"];
            } else if (ch == '(') {
                [_inputString appendFormat:@"0-"];
            } else if (ch == '.') {
                
            } else {
                [_inputString appendFormat:@"-"];
            }
        }
    } else if (button.tag == 102) {
        if ([_inputString length] == 0) {
            [_inputString appendFormat:@"0+"];
        } else {
            char ch = [_inputString characterAtIndex:[_inputString length] - 1];
            if (ch == '(' || ch == '.') {
            } else if (ch == '-' || ch == '*' || ch == '/' || ch == '+') {
                [_inputString replaceCharactersInRange:NSMakeRange([_inputString length] - 1, 1) withString:@"+"];
            } else if (ch == '.') {
                
            } else {
                [_inputString appendFormat:@"+"];
            }
        }
    } else if (button.tag == 104) {
        if ([_inputString length] == 0) {
            
        } else {
            char ch = [_inputString characterAtIndex:[_inputString length] - 1];
            if (ch == '(' || ch == '.') {
            } else if (ch == '-' || ch == '+' || ch == '/' || ch == '*') {
                [_inputString replaceCharactersInRange:NSMakeRange([_inputString length] - 1, 1) withString:@"*"];
            } else if (ch == '.') {
                
            }  else {
                [_inputString appendFormat:@"*"];
            }
        }
        
    } else if (button.tag == 105) {
        if ([_inputString length] == 0) {
            
        } else {
            char ch = [_inputString characterAtIndex:[_inputString length] - 1];
            if (ch == '(' || ch == '.') {
            } else if (ch == '-' || ch == '+' || ch == '*' || ch == '/') {
                [_inputString replaceCharactersInRange:NSMakeRange([_inputString length] - 1, 1) withString:@"/"];
            } else if (ch == '.') {
                
            } else {
                [_inputString appendFormat:@"/"];
            }
        }
    } else if (button.tag == 109) {
        _myModel.Flag = 0;
        _inputString = [NSMutableString stringWithFormat:@""];
    } else if (button.tag == 100) {
        if ([_myModel stringPretreatment:_inputString] == 0) {
            float temp = [_myModel stringManage:_inputString];
            if (_myModel.Flag == 1) {
                _inputString = [NSMutableString stringWithFormat:@"不能除以0"];
            } else {
                NSMutableString* Temp = [NSMutableString stringWithFormat:@"%f", temp];
                _inputString = [NSMutableString stringWithFormat:@"%@", [self removeFloatAllZeroByString:Temp]];
            }
        } else {
            _inputString = [NSMutableString stringWithFormat:@"格式错误"];
        }
    } else if (button.tag == 101){
        if ([_inputString length] == 0) {
            
        } else {
            char ch = [_inputString characterAtIndex:[_inputString length] - 1];
            if (ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '(') {
                [_inputString appendFormat:@"0."];
            } else if (ch == ')') {
            } else {
               [_inputString appendFormat:@"."];
            }
        }
    } else {
        [_inputString appendFormat:@"%ld", button.tag];
    }
    _myView.textField.text = _inputString;
}
- (NSMutableString*)removeFloatAllZeroByString:(NSMutableString *)testNumber {
    
    NSMutableString * outNumber = [NSMutableString stringWithFormat:@"%@",@(testNumber.floatValue)];
    return outNumber;
}
@end
