//
//  ViewController.m
//  gibberish
//
//  Created by Oliver Johansson on 2018-01-17.
//  Copyright © 2018 Oliver Johansson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UITextView *textarea;
@property (nonatomic) NSSet *consonants;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.consonants = [NSSet setWithObjects:@"b", @"c", @"d", @"f", @"g", @"h", @"j", @"k", @"l", @"m", @"n", @"p", @"q", @"r", @"s", @"t", @"v",@"w", @"x", @"z", nil];
}

- (NSString*)gibberish:(NSString*)val {
    NSString *message = @"";
    
    for (NSInteger i = 0; i < val.length; i++){
        NSString* currChar = [NSString stringWithFormat:@"%c", [val characterAtIndex:i]];
        BOOL isConsonant = [self.consonants containsObject:currChar];
        
        if (isConsonant) {
            NSString* appendText = [NSString stringWithFormat:@"%@o%@", currChar, currChar];
            message = [message stringByAppendingString:appendText];
        } else {
            message = [message stringByAppendingString:currChar];
        }
    }
    
    return message;
}

- (IBAction)inputEvt:(id)sender {
    self.textarea.text = [self gibberish:self.inputField.text];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
