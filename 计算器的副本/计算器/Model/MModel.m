//
//  MModel.m
//  计算器
//
//  Created by haoqianbiao on 2021/9/27.
//

#import "MModel.h"

@implementation MModel


- (instancetype)init {
    self = [super init];
    if (self) {
        _Flag = 0;
    }
    return self;
}

int isZero (float a) {
    if (a == 0) {
        return 1;
    } else {
        return 0;
    }
}

int isNumber(char c) {
    if (c >= '0' && c <= '9') {
        return 1;
    } else {
        return 0;
    }
}

int isBracket(char c) {
    if (c == '(' || c ==')') {
        return 1;
    } else {
        return 0;
    }
}

- (int)stringPretreatment:(NSMutableString*) string {
    NSMutableString* str = [NSMutableString stringWithFormat:@"%@#", string];
    operatorStack* stack = malloc(sizeof(operatorStack));
    stack->top = -1;
    int i = 0;
    char c = [str characterAtIndex:i];
    int flag = 0;
    while (c != '#') {
        if (isBracket(c)) {
            flag = 1;
            if (c == '(') {
                pushOperator(stack, c);
            } else {
                if (popOperator(stack) == 1 && flag == 1) {
                    return 0;
                }
            }
        }
        i++;
        c = [str characterAtIndex:i];
    }
    if (flag == 1) {
        return 1;
    } else {
        return 0;
    }
    
}

- (float)stringManage:(NSMutableString*) string {
    char c;
    int flag = 0;
    NSMutableString* str = [NSMutableString stringWithFormat:@"%@#", string];
    numberStack* number = malloc(sizeof(numberStack));
    number->top = -1;
    
    operatorStack* operator= malloc(sizeof(operatorStack));
    operator->top = 0;
    operator->data[0] = '#';
    
    int i = 0;
    c = [str characterAtIndex:i];
    while (c != '#') {
        c = [str characterAtIndex:i];
        if (isNumber(c)) {
            float decade = 0, decimal = 10;
            while (isnumber(c) || c == '.') {
                if (c == '.') {
                    i++;
                    c = [str characterAtIndex:i];
                    while (isnumber(c)) {
                        decade = decade + (c - '0') / decimal;
                        decimal = decimal * 10;
                        i++;
                        c = [str characterAtIndex:i];
                    }
                } else {
                    decade = decade * 10 + c - '0';
                    i++;
                    c = [str characterAtIndex:i];
                }
            }
            pushNumber(number, decade);
        } else {
            int flag = 0;
            if (c == '(' ) {
                flag++;
                pushOperator(operator, c);
                i++;
                while (flag) {
                    c = [str characterAtIndex:i];
                    if (isNumber(c)) {
                        float decade = 0, decimal = 10;
                        while (isnumber(c) || c == '.') {
                            if (c == '.') {
                                i++;
                                c = [str characterAtIndex:i];
                                while (isnumber(c)) {
                                    decade = decade + (c - '0') / decimal;
                                    decimal = decimal * 10;
                                    i++;
                                    c = [str characterAtIndex:i];
                                }
                            } else {
                                decade = decade * 10 + c - '0';
                                i++;
                                c = [str characterAtIndex:i];
                            }
                        }
                        pushNumber(number, decade);
                    } else if (c == '(') {
                        flag++;
                        pushOperator(operator, c);
                        i++;
                    } else {
                        if (c == ')') {
                            flag--;
                            while (getOperatorTop(operator) != '(') {
                                float b = number->data[number->top--];
                                float a = number->data[number->top--];
                                if (getOperatorTop(operator) == '/' && b == 0) {
                                    _Flag = 1;
                                } else {
                                    pushNumber(number, calculate(a, b, getOperatorTop(operator)));
                                    popOperator(operator);
                                }
                            }
                            popOperator(operator);
                            i++;
                        } else {
                            if (compare(c) < compare(operator->data[operator->top]) && operator->data[operator->top] != '(') {
                                float b = number->data[number->top--];
                                float a = number->data[number->top--];
                                if (getOperatorTop(operator) == '/' && b == 0) {
                                    _Flag = 1;
                                } else {
                                    pushNumber(number, calculate(a, b, getOperatorTop(operator)));
                                    popOperator(operator);
                                }                            } else {
                                pushOperator(operator, c);
                                i++;
                            }
                        }
                    }
                }
            } else {
                if (compare(c) <= compare(operator->data[operator->top])) {
                    float b = number->data[number->top--];
                    float a = number->data[number->top--];
                    if (getOperatorTop(operator) == '/' && b == 0) {
                        _Flag = 1;
                    } else {
                        pushNumber(number, calculate(a, b, getOperatorTop(operator)));
                        popOperator(operator);
                    }
                } else {
                    pushOperator(operator, c);
                    i++;
                }
            }
        }
    }
    if (_Flag == 1) {
        return -1;
    } else {
        while (number->top - 1 >= 0) {
            float b = number->data[number->top--];
            float a = number->data[number->top--];
            if (getOperatorTop(operator) == '/' && b == 0) {
                _Flag = 1;
            } else {
                pushNumber(number, calculate(a, b, getOperatorTop(operator)));
                popOperator(operator);
            }
        }
        return number->data[0];
    }
   
}

int compare (char c) {
    if (c == '+' || c == '-') {
            return 1;
    } else if (c == '*' || c == '/') {
            return 2;
    } else if (c == '(' || c == ')') {
        return 3;
    } else {
        return -1;
    }
}

float calculate(float a, float b, char c) {
    switch(c) {
        case '+':
            return a + b;
        case '-':
            return a - b;
        case '*':
            return a * b;
        case '/':
            return a / b;
        default:
            return 0;
            break;
    }
}

int pushNumber(numberStack* stack, float number) {
    if (stack->top == Max - 1) {
        return 0;
    } else {
        stack->data[++stack->top] = number;
        return 1;
    }
}

int pushOperator(operatorStack* stack, char operator) {
    if (stack->top == Max - 1) {
        return 0;
    } else {
        stack->data[++stack->top] = operator;
        return 1;
    }
}

int popNumber(numberStack* stack) {
    if (stack->top == -1) {
        return 0;
    } else {
        stack->top--;
        return 1;
    }
}

int popOperator(operatorStack* stack) {
    if (stack->top == -1) {
        return 0;
    } else {
        stack->data[stack->top] = '\0';
        stack->top--;
        return 1;
    }
}

char getOperatorTop(operatorStack* stack) {
    if (stack->top == -1) {
        return '0';
    } else {
        return stack->data[stack->top];
    }
}

float getNumberTop(numberStack* stack) {
    if (stack->top == -1) {
        return 0;
    } else {
        return stack->data[stack->top];
    }
}
@end

