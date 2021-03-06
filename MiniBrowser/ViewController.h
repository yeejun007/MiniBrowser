//
//  ViewController.h
//  MiniBrowser
//
//  Created by 송이준 on 28/07/2020.
//  Copyright © 2020 yeejun. All rights reserved.
//

#import <UIKit/UIKit.h>

// 애플이 준비해둔 프로토콜을 delegate를 통해 사용하기 위해 < > 괄호 안에 명시해준다
@interface ViewController : UIViewController<UITextFieldDelegate, UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *bookmarkSegmentControl;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;
- (IBAction)bookmarkAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
- (IBAction)backAction:(id)sender;
- (IBAction)forwardAction:(id)sender;
- (IBAction)stopAction:(id)sender;
- (IBAction)refreshAction:(id)sender;


@end

