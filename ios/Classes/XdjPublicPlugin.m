#import "XdjPublicPlugin.h"
#if __has_include(<xdj_public/xdj_public-Swift.h>)
#import <xdj_public/xdj_public-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "xdj_public-Swift.h"
#endif

@implementation XdjPublicPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftXdjPublicPlugin registerWithRegistrar:registrar];
}
@end
