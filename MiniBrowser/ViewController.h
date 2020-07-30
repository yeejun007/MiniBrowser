//
//  ViewController.h
//  MiniBrowser
//
//  Created by 송이준 on 28/07/2020.
//  Copyright © 2020 yeejun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *bookmarkSegmentControll;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;


@end

