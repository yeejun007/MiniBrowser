//
//  ViewController.h
//  MiniBrowser
//
//  Created by 송이준 on 28/07/2020.
//  Copyright © 2020 yeejun. All rights reserved.
//

#import <UIKit/UIKit.h>

// 애플이 준비해둔 프로토콜을 delegate를 통해 사용하기 위해 < > 괄호 안에 명시해준다
@interface ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *bookmarkSegmentControll;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;


@end

