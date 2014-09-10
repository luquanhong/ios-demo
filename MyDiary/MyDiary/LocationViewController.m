//
//  LocationViewController.m
//  MyDiary
//
//  Created by luquanhong on 14-8-19.
//  Copyright (c) 2014年 yy. All rights reserved.
//

//基库，一系列的Class(类)来建立和管理iPhone OS应用程序的用户界面接口、应用程序对象、事件控制、绘图模型、窗口、视图和用于控制触摸屏等的接口
#import <AddressBook/AddressBook.h>
//地址薄框架提供联系人数据库，通讯数据库等
#import <AddressBookUI/AddressBookUI.h>
#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor: [UIColor grayColor] ];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    [self.locationManager setDistanceFilter: kCLDistanceFilterNone];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [self.locationManager startUpdatingLocation];
    
    _way2 = NO;
    NSLog(@"location viewdidload exit");
    
    //[self.locationManager setPurpose:@"I hope to use the location server"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark

- (void)locationManager:(CLLocationManager*)manager didUpdateLocations:(NSArray*)locations{
    
    CLLocation* location = (CLLocation *)[locations objectAtIndex:0];
    
    NSLog(@"%@", location);
}

- (void)locationManager:(CLLocationManager*)manager didFailWithError:(NSError*)error{

    NSLog(@"device location error : %@", error);
}



- (IBAction)addContact:(id)sender {

    
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    
    picker.peoplePickerDelegate = self;
    
    //将手机，邮箱，生日数据压入数组
    NSArray *displayedItems = [NSArray arrayWithObjects:[NSNumber numberWithInt:kABPersonPhoneProperty],
                               [NSNumber numberWithInt:kABPersonEmailProperty],
                               [NSNumber numberWithInt:kABPersonBirthdayProperty], nil];
    
    //设置需要显示的数据
    picker.displayedProperties = displayedItems;
    
    [self presentModalViewController:picker animated:YES];

    _way2 = NO;

}

- (IBAction)addContact2:(id)sender {
    
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    
    picker.peoplePickerDelegate = self;
    
    [self presentModalViewController:picker animated:YES];
    
    _way2 = YES;
}

#pragma mark - ABPeoplePickerNavigationControllerDelegate

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    BOOL hadPhone = NO;
    NSString *phone = @"138027567160";
    if(phone != nil)
    {
        
        if(_way2 == YES){
        
//            ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutableCopy (ABRecordCopyValue(person, kABPersonPhoneProperty));
//            ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)phone, kABPersonPhoneIPhoneLabel, NULL);
//            ABRecordSetValue(person, kABPersonPhoneProperty, multiPhone,nil);
//
//            ABAddressBookRef ab = peoplePicker.addressBook;
//            CFErrorRef* error = NULL;
//            ABAddressBookSave(ab, error);
//            CFRelease(multiPhone);
//            return YES;
        }
        else{
            _picker = peoplePicker;
            
            CFErrorRef error = NULL;

            
            ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
            //取得电话号码属性
            ABMultiValueRef phoneNumberProperty = ABRecordCopyValue(person, kABPersonPhoneProperty);
            NSArray* phoneNumberArray = CFBridgingRelease(ABMultiValueCopyArrayOfAllValues(phoneNumberProperty));
            
            NSLog(@"=====phoneNumberArray is %d", [phoneNumberArray count]);
            for(int index = 0; index< [phoneNumberArray count]; index++){
                NSString *phoneNumber = [phoneNumberArray objectAtIndex:index];
                NSString *phoneNumberLabel = CFBridgingRelease(ABMultiValueCopyLabelAtIndex(phoneNumberProperty, index));
                
            
    //            if ([phoneNumberLabel isEqualToString:(NSString*)kABPersonPhoneMobileLabel]) {
    //                NSLog(@"kABPersonPhoneMobileLabel %@", phoneNumber );
    //                ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)phoneNumber, kABPersonPhoneMobileLabel , NULL);
    //            } else if ([phoneNumberLabel isEqualToString:(NSString*)kABPersonPhoneIPhoneLabel]) {
    //                NSLog(@"kABPersonPhoneIPhoneLabel %@", phoneNumber );
    //                ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)phoneNumber, kABPersonPhoneIPhoneLabel , NULL);
    //            } else {
    //                //ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)phoneNumber, kABPersonPhoneIPhoneLabel , NULL);
    //                NSLog(@"%@: %@", @"其它电话", phoneNumber);
    //            }
                
                ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)phoneNumber, CFBridgingRetain(phoneNumberLabel) , NULL);
                NSLog(@"kABPersonPhoneIPhoneLabel is %@ =====phoneNumberLabel is %@ phoneNumber is %@",kABPersonPhoneIPhoneLabel, phoneNumberLabel, phoneNumber);
                //ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)phoneNumber, kABPersonPhoneIPhoneLabel , NULL);
                
                if([phoneNumber isEqualToString:phone]){
                     hadPhone = YES;
                }

            }
         
            if( !hadPhone){
                NSLog(@"hadPhone false===== add new");
                ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)phone, kABPersonPhoneIPhoneLabel , NULL);
                ABRecordSetValue(person, kABPersonPhoneProperty, multiPhone,&error);
            }
            
            CFRelease(multiPhone);
            CFRelease(phoneNumberProperty);
            
            ABNewPersonViewController *creater = [[ABNewPersonViewController alloc] init];
            creater.displayedPerson = person;
            creater.newPersonViewDelegate = self;
            [creater setDisplayedPerson:person];
            [peoplePicker pushViewController:creater animated:YES];
        }
        
//        
//        ABUnknownPersonViewController *unknown=[[ABUnknownPersonViewController alloc]init];
//        
//        unknown.displayedPerson=person;
//        
//        unknown.allowsAddingToAddressBook=YES;//允许添加
//        [peoplePicker pushViewController:unknown animated:YES];
        

        
        //[self setTopMostViewHidden:YES];
        //[self.navigationController pushViewController:creater animated:YES];
        
//        ABPersonViewController *ViewPicker = [[ABPersonViewController alloc] init];
//        ViewPicker.personViewDelegate = self;
//        [ViewPicker setDisplayedPerson:person];
//        ViewPicker.allowsEditing = YES;
//        [peoplePicker pushViewController:ViewPicker animated:YES];
     
        
//        //取得电话号码属性
//        ABMultiValueRef phoneNumberProperty = ABRecordCopyValue(person, kABPersonPhoneProperty);
//        NSArray* phoneNumberArray = CFBridgingRelease(ABMultiValueCopyArrayOfAllValues(phoneNumberProperty));
//        for(int index = 0; index< [phoneNumberArray count]; index++){
//            NSString *phoneNumber = [phoneNumberArray objectAtIndex:index];
//            NSString *phoneNumberLabel = CFBridgingRelease(ABMultiValueCopyLabelAtIndex(phoneNumberProperty, index));
//            
//            if ([phoneNumberLabel isEqualToString:(NSString*)kABPersonPhoneMobileLabel]) {
//                NSLog(@"kABPersonPhoneMobileLabel %@", phoneNumber );
//            } else if ([phoneNumberLabel isEqualToString:(NSString*)kABPersonPhoneIPhoneLabel]) {
//                NSLog(@"kABPersonPhoneIPhoneLabel %@", phoneNumber );
//            } else {
//                NSLog(@"%@: %@", @"其它电话", phoneNumber);
//            }
//        }
//        CFRelease(phoneNumberProperty);
     
        
        

    }
    
    return NO;
}

//
//- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
//{
//    
//}

#pragma mark - ABNewPersonViewController Delegate
- (void)newPersonViewController: (ABNewPersonViewController*)newPersonViewController didCompleteWithNewPerson:(ABRecordRef)person
{
    
    if(person){
        
    
    
    NSLog(@"didCompleteWithNewPerson");
        ABAddressBookRef ab = _picker.addressBook;
        CFErrorRef* error = NULL;
        ABAddressBookSave(ab, error);
    }else{
        NSLog(@"newPersonViewController person == nil");
    }
        
        
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
