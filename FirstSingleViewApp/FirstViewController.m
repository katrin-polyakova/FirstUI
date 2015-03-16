//
//  FirstViewController.m
//  FirstSingleViewApp
//
//  Created by Kate Polyakova on 3/1/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelMassage;
@property (weak, nonatomic) IBOutlet UIButton *buttonShowLabel;
@property (strong, nonatomic) IBOutlet UILabel *labelSliderValue;
@property (weak, nonatomic) IBOutlet UISlider *slider;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.buttonShowLabel.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.buttonShowLabel.layer setBorderWidth:1.4f];
    [self.buttonShowLabel.layer setCornerRadius:10];
    
    self.labelSliderValue.text = [NSString stringWithFormat:@"%g", self.slider.value];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onPan:(id)rec {
        CGPoint point = [rec locationInView:self.view];
        CGRect viewFrame = self.view.frame;
        CGFloat hue = point.x / viewFrame.size.width;
        CGFloat sat = point.y / viewFrame.size.height;
        UIColor *color = [UIColor colorWithHue:hue saturation:sat brightness:0.85 alpha:1];
        [self.view setBackgroundColor:color];

}
- (IBAction)onButtonPress:(id)sender {
    self.labelMassage.hidden = !self.labelMassage.hidden;

    NSString *title = self.labelMassage.hidden ? @"Show" : @"Hide";
    [self.buttonShowLabel setTitle:title forState:UIControlStateNormal];

}
- (IBAction)onSwitchChanged:(UISwitch*)sender {
    BOOL switchState = [sender isOn];
    self.buttonShowLabel.enabled = switchState;
    self.buttonShowLabel.backgroundColor = switchState ? [UIColor greenColor] : [UIColor redColor];
}

- (IBAction)onSlide:(UISlider*)sender {
    
    self.labelSliderValue.text = [NSString stringWithFormat:@"%.2g", self.slider.value];
    
}


@end



