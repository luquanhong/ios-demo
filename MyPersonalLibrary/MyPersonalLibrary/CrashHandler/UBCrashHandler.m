//
//  UBCrashHandler.m
//  MyPersonalLibrary
//
//  Created by 卢泉鸿 on 15/4/30.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import <libkern/OSAtomic.h>
#import <execinfo.h>
#import "UBCrashHandler.h"

volatile int32_t UncaughtExceptionCount = 0;
const int32_t UncaughtExceptionMaximum = 10;

#define UBCrashHandlerSignalKey             @"UBCrashHandlerSignalKey"
#define UBCrashHandlerAddressesKey          @"UBCrashHandlerAddressesKey"
#define UBCrashHandlerSignalExceptionName   @"UBCrashHandlerSignalExceptionName"

const NSInteger UncaughtExceptionHandlerSkipAddressCount = 4;
const NSInteger UncaughtExceptionHandlerReportAddressCount = 5;

@implementation UBCrashHandler

+ (NSArray*)backtrace{
    
    void* callstack[128];
    int frames = backtrace(callstack, 128);
    char **str = backtrace_symbols(callstack, frames);
    
    int i;
    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
    for (i = UncaughtExceptionHandlerSkipAddressCount;
         i < UncaughtExceptionHandlerSkipAddressCount + UncaughtExceptionHandlerReportAddressCount;
         i++) {
        [backtrace addObject:[NSString stringWithUTF8String:str[i]]];
    }
    free(str);
    
    return backtrace;
}

- (void)handleException:(NSException*)exception{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Exception" message:@"message " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];

    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    CFArrayRef allModes = CFRunLoopCopyAllModes(runLoop);
    
    while (!dismissed) {
        for (NSString *mode in (NSArray*)CFBridgingRelease(allModes)) {
            CFRunLoopRunInMode((CFStringRef)CFBridgingRetain(mode), 0.001, false);
        }
    }
    
    CFRelease(allModes);
    
    NSSetUncaughtExceptionHandler(NULL);
    signal(SIGABRT, SIG_DFL);
    signal(SIGFPE, SIG_DFL);
    signal(SIGSEGV, SIG_DFL);
    signal(SIGILL, SIG_DFL);
    signal(SIGBUS, SIG_DFL);
    signal(SIGPIPE, SIG_DFL);
    
    if ([[exception name] isEqualToString:UBCrashHandlerSignalExceptionName]) {
        kill(getpid(), [[[exception userInfo] objectForKey:UBCrashHandlerSignalKey] intValue]);
    }else{
        [exception raise];
    }
}


@end

void HandleException(NSException *exception){
    
    int32_t exceptionCount = OSAtomicIncrement32(&UncaughtExceptionCount);
    if (exceptionCount > UncaughtExceptionMaximum) {
        return;
    }

    NSArray *callstack = [UBCrashHandler backtrace];
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary:[exception userInfo]];
    [userInfo setObject:callstack forKey:UBCrashHandlerAddressesKey];
    [[[UBCrashHandler alloc] init] performSelectorOnMainThread:@selector(handleException:)
                                                    withObject:[NSException exceptionWithName:[exception name]
                                                                                       reason:[exception reason]
                                                                                     userInfo:userInfo]
                                                 waitUntilDone:YES];
}

void SignalHandler(int signal){
    
    int32_t exceptionCount = OSAtomicIncrement32(&UncaughtExceptionCount);
    if (exceptionCount > UncaughtExceptionMaximum) {
        return;
    }
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:[NSNumber numberWithInt:signal] forKey:UBCrashHandlerSignalKey];
    NSArray* callstack = [UBCrashHandler backtrace];
    [userInfo setObject:callstack forKeyedSubscript:UBCrashHandlerAddressesKey];
    
    [[[UBCrashHandler alloc] init] performSelectorOnMainThread:@selector(handleException:)
                                                    withObject:[NSException
                                                                exceptionWithName:UBCrashHandlerSignalExceptionName
                                                                reason:[NSString stringWithFormat:@"Signal %d was raised", signal]
                                                                 userInfo:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:signal] forKey:UBCrashHandlerSignalKey]]
                                                 waitUntilDone:YES];
}

void InstallCrashExceptionHandler(){
    
    NSSetUncaughtExceptionHandler(&HandleException);
    signal(SIGABRT, SignalHandler);
    signal(SIGFPE, SignalHandler);
    signal(SIGSEGV, SignalHandler);
    signal(SIGILL, SignalHandler);
    signal(SIGBUS, SignalHandler);
    signal(SIGPIPE, SignalHandler);
}
