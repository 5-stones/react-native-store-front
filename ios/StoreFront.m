#import "StoreFront.h"
#import <StoreKit/StoreKit.h>

@implementation StoreFront

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(getStoreFront:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
    if (@available(iOS 13.0, *)) {
        SKStorefront *storefront = [SKPaymentQueue defaultQueue].storefront;
        if (storefront) {
            resolve(storefront.countryCode);
        } else {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self getStoreFront:resolve reject:reject];
            });
        }
    } else {
        resolve(nil);
    }
}

@end
