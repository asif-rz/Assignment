//
//  ARGlobalAlertController+Window.m
//  Asif Raza Codes
//
//  Created by Asif Raza on 30/05/18.
//  Copyright © 2018 Asif Raza. All rights reserved.
//

#import "ARGlobalAlertController+Window.h"
#import <objc/runtime.h>

@interface UIAlertController (Private)

@property (nonatomic, strong) UIWindow *alertWindow;

@end

@implementation UIAlertController (Private)

@dynamic alertWindow;

- (void)setAlertWindow:(UIWindow *)alertWindow {
    objc_setAssociatedObject(self, @selector(alertWindow), alertWindow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIWindow *)alertWindow {
    return objc_getAssociatedObject(self, @selector(alertWindow));
}

@end

@implementation UIAlertController (Window)

- (void)show {
    [self show:YES];
}

- (void)show:(BOOL)animated {
    self.alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.alertWindow.rootViewController = [[UIViewController alloc] init];
    self.alertWindow.windowLevel = UIWindowLevelAlert + 1;
    [self.alertWindow makeKeyAndVisible];
    [self.alertWindow.rootViewController presentViewController:self animated:animated completion:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // precaution to insure window gets destroyed
    self.alertWindow.hidden = YES;
    self.alertWindow = nil;
}

#pragma mark - Shared Instance

+ (instancetype)shared
{
    static ARGlobalAlertController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
        // Do any other initialisation stuff here
    });
    return shared;
}

- (id) init
{
    if(self = [super init]) {}
    return self;
}

#pragma mark - Show Alert

- (instancetype)showAlertWithTitle:(NSString *)title
                           message:(nullable NSString *)message {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:nil destructiveButtonTitle:nil otherTitles:nil otherTitleIcons:nil iconRenderingModeOriginal:false iconPosition:ARGlobalAlertActionIconPositionLeft preferredStyle:ARGlobalAlertControllerStyleAlert handler:nil];
    [alert show];
    
    return alert;
}

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherTitles:nil otherTitleIcons:nil iconRenderingModeOriginal:false iconPosition:ARGlobalAlertActionIconPositionLeft preferredStyle:ARGlobalAlertControllerStyleAlert handler:nil];
    [alert show];
    
    return alert;
}

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                       otherTitles:(nullable NSArray <NSString *>*)actionTitles
                           handler:(nullable HandlerBlock)handlerBlock {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:nil destructiveButtonTitle:nil otherTitles:actionTitles otherTitleIcons:nil iconRenderingModeOriginal:false iconPosition:ARGlobalAlertActionIconPositionLeft preferredStyle:ARGlobalAlertControllerStyleAlert handler:^(NSString * _Nullable tappedButtonTitle) {
        handlerBlock(tappedButtonTitle);
    }];
    [alert show];
    
    return alert;
}

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                       otherTitles:(nullable NSArray <NSString *>*)actionTitles
                           handler:(nullable HandlerBlock)handlerBlock {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherTitles:actionTitles otherTitleIcons:nil iconRenderingModeOriginal:false iconPosition:ARGlobalAlertActionIconPositionLeft preferredStyle:ARGlobalAlertControllerStyleAlert handler:^(NSString * _Nullable tappedButtonTitle) {
        handlerBlock(tappedButtonTitle);
    }];
    [alert show];
    
    return alert;
}

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
            destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                       otherTitles:(nullable NSArray <NSString *>*)actionTitles
                           handler:(nullable HandlerBlock)handlerBlock {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:nil destructiveButtonTitle:destructiveButtonTitle otherTitles:actionTitles otherTitleIcons:nil iconRenderingModeOriginal:false iconPosition:ARGlobalAlertActionIconPositionLeft preferredStyle:ARGlobalAlertControllerStyleAlert handler:^(NSString * _Nullable tappedButtonTitle) {
        handlerBlock(tappedButtonTitle);
    }];
    [alert show];
    
    return alert;
}

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                       otherTitles:(nullable NSArray <NSString *>*)actionTitles
                    preferredStyle:(ARGlobalAlertControllerStyle)preferredStyle
                           handler:(nullable HandlerBlock)handlerBlock {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherTitles:actionTitles otherTitleIcons:nil iconRenderingModeOriginal:false iconPosition:ARGlobalAlertActionIconPositionLeft preferredStyle:preferredStyle handler:^(NSString * _Nullable tappedButtonTitle) {
        handlerBlock(tappedButtonTitle);
    }];
    [alert show];
    
    return alert;
}

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                       otherTitles:(nullable NSArray <NSString *>*)actionTitles
                   otherTitleIcons:(nullable NSArray <NSString *>*)actionTitleIcons
                 iconRenderingModeOriginal:(BOOL)isOriginal
                      iconPosition:(ARGlobalAlertActionIconPosition)position
                    preferredStyle:(ARGlobalAlertControllerStyle)preferredStyle
                           handler:(nullable HandlerBlock)handlerBlock {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherTitles:actionTitles otherTitleIcons:actionTitleIcons iconRenderingModeOriginal:isOriginal iconPosition:position preferredStyle:preferredStyle handler:^(NSString * _Nullable tappedButtonTitle) {
        handlerBlock(tappedButtonTitle);
    }];
    [alert show];
    
    return alert;
}

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                  autoHideDuration:(NSInteger)autoHideDuration {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:nil destructiveButtonTitle:nil otherTitles:nil otherTitleIcons:nil iconRenderingModeOriginal:false iconPosition:ARGlobalAlertActionIconPositionLeft preferredStyle:ARGlobalAlertControllerStyleAlert handler:nil];
    [alert show];
    
    [self hideAlert:alert afterDuration:autoHideDuration];
    
    return alert;
}
    
- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                  autoHideDuration:(NSInteger)autoHideDuration {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherTitles:nil otherTitleIcons:nil iconRenderingModeOriginal:false iconPosition:ARGlobalAlertActionIconPositionLeft preferredStyle:ARGlobalAlertControllerStyleAlert handler:nil];
    [alert show];
    
    [self hideAlert:alert afterDuration:autoHideDuration];
    
    return alert;
}

#pragma mark - Hide Alert

- (void) hideAlert:(ARGlobalAlertController *)alert {
    [self hideAlert:alert afterDuration:0];
}

- (void) hideAlert:(ARGlobalAlertController *)alert afterDuration:(NSInteger)duration {
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [alert dismissViewControllerAnimated:YES completion:nil];
    });
}

#pragma mark - Alert Initialization

- (instancetype)alertWithTitle:(nullable NSString *)title
                       message:(nullable NSString *)message
             cancelButtonTitle:(nullable NSString *)cancelButtonTitle
        destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                   otherTitles:(nullable NSArray <NSString *>*)actionTitles
               otherTitleIcons:(nullable NSArray <NSString *>*)actionTitleIcons
     iconRenderingModeOriginal:(BOOL)isOriginal
                  iconPosition:(ARGlobalAlertActionIconPosition)position
                preferredStyle:(ARGlobalAlertControllerStyle)preferredStyle
                       handler:(nullable HandlerBlock)handlerBlock {
    
    ARGlobalAlertController *alert = [ARGlobalAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyle)preferredStyle];
    
    if(actionTitles.count > 0)
        
        for (int index = 0; index < actionTitles.count; index++) {
            
            
            if(preferredStyle == ARGlobalAlertControllerStyleActionSheet) {

                    UIAlertAction * action = [ARGlobalAlertAction actionWithTitle:actionTitles[index] style:UIAlertActionStyleDefault handler:^(ARGlobalAlertAction * _Nonnull action) {
                        if (handlerBlock) handlerBlock(actionTitles[index]);
                    }];
                    if(![actionTitleIcons[index] isEqualToString:@""]) {
                        
                        UIImage *image;
                        if(preferredStyle == ARGlobalAlertControllerStyleActionSheet) {
                            image = [self getImageWithAlert:alert title:actionTitles[index] titleIcon:actionTitleIcons[index] iconRenderingModeOriginal:isOriginal iconPosition:position];
                        }
                        [action setValue:image forKey:@"image"];
                    }
                    [alert addAction:action];
            
            } else {
                
                if(![actionTitles[index] isEqualToString:@""])
                {
                    UIAlertAction * action = [ARGlobalAlertAction actionWithTitle:actionTitles[index] style:UIAlertActionStyleDefault handler:^(ARGlobalAlertAction * _Nonnull action) {
                        if (handlerBlock) handlerBlock(actionTitles[index]);
                    }];
                    if(![actionTitleIcons[index] isEqualToString:@""]) {
                        
                        UIImage *image;
                        if(preferredStyle == ARGlobalAlertControllerStyleActionSheet) {
                            image = [self getImageWithAlert:alert title:actionTitles[index] titleIcon:actionTitleIcons[index] iconRenderingModeOriginal:isOriginal iconPosition:position];
                        }
                        [action setValue:image forKey:@"image"];
                    }
                    [alert addAction:action];
                }
            }
        }

    if(destructiveButtonTitle)
        [alert addAction:[UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (handlerBlock) handlerBlock(destructiveButtonTitle);
        }]];
    
    if(cancelButtonTitle)
        [alert addAction:[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
            if (handlerBlock) handlerBlock(cancelButtonTitle);
        }]];
    
    return alert;
}

- (UIImage *)getImageWithAlert:(UIAlertController *)alert title:(NSString *)actionTitle
                 titleIcon:(NSString *)actionTitleIcon
       iconRenderingModeOriginal:(BOOL)isOriginal
                        iconPosition:(ARGlobalAlertActionIconPosition)position {
    
    UIImage *finalImage;
    
    finalImage = isOriginal ? [[UIImage imageNamed:actionTitle] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] : [UIImage imageNamed:actionTitleIcon];
    
    if(![actionTitle isEqualToString:@""] && position == ARGlobalAlertActionIconPositionCenter) {
        position = ARGlobalAlertActionIconPositionLeft;
    }
    
    switch (position) {
        case ARGlobalAlertActionIconPositionCenter:
        {
            CGFloat alertViewPadding = 22.0;
            CGFloat center = -alert.view.frame.size.width / 2 + finalImage.size.width / 2 + alertViewPadding;
            finalImage = [finalImage imageWithAlignmentRectInsets:UIEdgeInsetsMake(0, center, 0, 0)];
            break;
        }
        case ARGlobalAlertActionIconPositionRight:
        {
            CGFloat alertViewPadding = 40.0;
            CGFloat left = -alert.view.frame.size.width + finalImage.size.width + alertViewPadding;
            finalImage = [finalImage imageWithAlignmentRectInsets:UIEdgeInsetsMake(0, left, 0, 0)];
            break;
        }
        default:
            break;
    }
    return finalImage;
}

//- (instancetype)alertWithTitle:(nullable NSString *)title
//                       message:(nullable NSString *)message
//             cancelButtonTitle:(nullable NSString *)cancelButtonTitle
//        destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
//                   otherTitles:(nullable NSArray <NSString *>*)actionTitles
//               otherTitleIcons:(nullable NSArray <NSString *>*)actionTitleIcons
//             iconRenderingModeOriginal:(BOOL)isOriginal
//                  iconPosition:(ARGlobalAlertActionIconPosition)position
//                preferredStyle:(ARGlobalAlertControllerStyle)preferredStyle
//                       handler:(nullable HandlerBlock)handlerBlock {
//
//    ARGlobalAlertController *alert = [ARGlobalAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyle)preferredStyle];
//
//    if(actionTitles.count > 0)
//
//        for (int index = 0; index < actionTitles.count; index++) {
//            if(![actionTitles[index] isEqualToString:@""])
//            {
//                UIAlertAction * action = [ARGlobalAlertAction actionWithTitle:actionTitles[index] style:UIAlertActionStyleDefault handler:^(ARGlobalAlertAction * _Nonnull action) {
//                    if (handlerBlock) handlerBlock(actionTitles[index]);
//                }];
//                if(![actionTitleIcons[index] isEqualToString:@""]) {
//
//
//                    UIImage *finalImage;
//
//                    finalImage = isOriginal ? [[UIImage imageNamed:actionTitleIcons[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] : [UIImage imageNamed:actionTitleIcons[index]];
//
////                    if(finalImage.size.height > 22.0) {
////                        finalImage = [self imageWithImage:finalImage scaledToHeight:22.0];
////                    }
//
//                    if(![actionTitles[index] isEqualToString:@""] && position == ARGlobalAlertActionIconPositionCenter) {
//                        position = ARGlobalAlertActionIconPositionLeft;
//                    }
//
//                    switch (position) {
//                        case ARGlobalAlertActionIconPositionCenter:
//                        {
//                            CGFloat alertViewPadding = 22.0;
//                            CGFloat left = -alert.view.frame.size.width / 2 + finalImage.size.width + alertViewPadding;
//                            finalImage = [finalImage imageWithAlignmentRectInsets:UIEdgeInsetsMake(0, left, 0, 0) ];
//                            break;
//                        }
//                        case ARGlobalAlertActionIconPositionRight:
//                        {
//                            CGFloat alertViewPadding = 40.0;
//                            CGFloat left = -alert.view.frame.size.width + finalImage.size.width + alertViewPadding;
//                            finalImage = [finalImage imageWithAlignmentRectInsets:UIEdgeInsetsMake(0, left, 0, 0) ];
//                            break;
//                        }
//                        default:
//                            break;
//                    }
//
//                    [action setValue:finalImage forKey:@"image"];
//
////                    CGFloat alertViewPadding = 40.0;
////                    CGFloat left = -alert.view.frame.size.width + finalImage.size.width + alertViewPadding;
////                    finalImage = [finalImage imageWithAlignmentRectInsets:UIEdgeInsetsMake(0, left, 0, 0) ];
////                    [action setValue:finalImage forKey:@"image"];
//
//                }
//                [alert addAction:action];
//            }
//        }
//
////        for (NSString *actionTitle in actionTitles)
////            if(actionTitle)
////                [alert addAction:[ARGlobalAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(ARGlobalAlertAction * _Nonnull action) {
////                    if (handlerBlock) handlerBlock(actionTitle);
////                }]];
//
//    if(destructiveButtonTitle)
//        [alert addAction:[UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//            if (handlerBlock) handlerBlock(destructiveButtonTitle);
//        }]];
//
//    if(cancelButtonTitle)
//        [alert addAction:[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            [alert dismissViewControllerAnimated:YES completion:nil];
//            if (handlerBlock) handlerBlock(cancelButtonTitle);
//        }]];
//
//    return alert;
//}

- (UIImage*)imageWithImage: (UIImage*) sourceImage scaledToHeight: (float) i_height
{
    float oldHeight = sourceImage.size.height;
    float scaleFactor = i_height / oldHeight;
    
    float newWidth = sourceImage.size.width * scaleFactor;
    float newHeight = oldHeight * scaleFactor;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(newWidth, newHeight), NO, 0);
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
