#import "ProviderBoilerplatePlugin.h"
#import <provider_boilerplate/provider_boilerplate-Swift.h>

@implementation ProviderBoilerplatePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftProviderBoilerplatePlugin registerWithRegistrar:registrar];
}
@end
