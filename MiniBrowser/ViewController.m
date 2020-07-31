//
//  ViewController.m
//  MiniBrowser
//
//  Created by 송이준 on 28/07/2020.
//  Copyright © 2020 yeejun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mainWebView, urlTextField, bookmarkSegmentControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // http로 접속이 안되는경우 보안때문임. https를 사용해야하는 웹인 경우 안될 수가 있다.
    // 이떄는 info.plist로 가서 App transfer security setting 추가
    // 그 아래에 다시 Allow Arbitrary Loads 추가하고 그 속성에 YES라고 수정하면 됨
    // urlTextField에 주소 입력할때, 맨 앞에 http:// <-- 이거 입력안하면 NSURL이 작동 안함
    NSString *urlString = @"http://www.facebook.com";
    [mainWebView loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: urlString]]];
    urlTextField.text = urlString;
    
    
}

// 앱의 키보드 키에서 return키 누르면 호출되는 함수임 (delegate 메소드이다)
// 현재 텍스트 입력하는 UI 컴포넌트는 ulrTextField 하나밖에 없음
// url을 입력하고 엔터(return 키보드 키)를 치면 해당 url로 이동하도록 하면된다
// storyboard에서 urlTextField 마우스 오른 클릭하고 delegate를 앱 자기 자신에게 이어준다
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *urlString = urlTextField.text;
    
    // 만약 주소입력칸에 http:// 가 빠져있다면 이거 붙여주는 로직 작성하기
    // NSString에 앞부부분 문자열 확인하는 메소드가 있음
    if(![urlString hasPrefix: @"http://"]) {
        // http:// 가 빠져있다면 urlString을 메모리에 새롭게 할당&초기화 시키기
        urlString = [[NSString alloc] initWithFormat:@"http://%@", urlString];
    }
    
    [mainWebView loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: urlString]]];
    // 포커스 비활성화 시켜서 키보드기 내려가도록 한다
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)bookmarkAction:(id)sender {
    // 문서보면 UISegmentedControl 클래스에서 해당 인덱스 가져오는 메소드가 있는거 볼 수 있음
    // 그리고 지정된 인덱스 segment의 title을 가져오는 메소드도 있다
    // 이 인덱스 숫자는 primitive타입이므로 변수 선언할 때 * 이거 붙이면 안됨
//    NSInteger bookmarkIndex =  <-- 이렇게 인덱스 가져와서 인덱스마다 조건문으로 분류해서 주소를 넘겨줄수도 있긴한데 그렇게 안함
    
    NSString *bookmarkURL = [bookmarkSegmentControl titleForSegmentAtIndex: bookmarkSegmentControl.selectedSegmentIndex];
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://www.%@.com", bookmarkURL];
    [mainWebView loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: urlString]]];
}

@end
