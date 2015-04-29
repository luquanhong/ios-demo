//
//  ShareViewController.m
//  ShareControllerView
//
//  Created by 卢泉鸿 on 15/4/20.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "ShareViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ShareViewController ()


@end

@implementation ShareViewController

- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (UIView *)loadPreviewView{
    return nil;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (NSExtensionItem *item in self.extensionContext.inputItems) {
        for (NSItemProvider *itemProvider in item.attachments) {
            if ([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypePropertyList]) {
                [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypePropertyList options:nil completionHandler:^(NSDictionary *jsDict, NSError *error) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        NSDictionary *jsPreprocessingResults = jsDict[NSExtensionJavaScriptPreprocessingResultsKey];
                        NSString *selectedText = jsPreprocessingResults[@"selection"];
                        NSString *pageTitle = jsPreprocessingResults[@"title"];
                        if ([selectedText length] > 0) {
                            self.myTextView.text = selectedText;
                        } else if ([pageTitle length] > 0) {
                            self.myTextView.text = pageTitle;
                        }
                    });
                }];
                
                break;
            }
        }
        
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.myTextView becomeFirstResponder];
}

//- (void)didSelectPost {
//    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
//    
//    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
//  
//    
//    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
//}


- (IBAction)postAction:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"iOSDemo://"];
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        //
    }];
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}

@end
