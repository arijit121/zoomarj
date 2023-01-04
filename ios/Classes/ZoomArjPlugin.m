#import "ZoomArjPlugin.h"
#if __has_include(<zoom_arj/zoom_arj-Swift.h>)
#import <zoom_arj/zoom_arj-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "zoom_arj-Swift.h"
#endif

@implementation ZoomArjPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftZoomArjPlugin registerWithRegistrar:registrar];
}
@end
