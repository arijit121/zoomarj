#ifndef FLUTTER_PLUGIN_ZOOM_ARJ_PLUGIN_H_
#define FLUTTER_PLUGIN_ZOOM_ARJ_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace zoom_arj {

class ZoomArjPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ZoomArjPlugin();

  virtual ~ZoomArjPlugin();

  // Disallow copy and assign.
  ZoomArjPlugin(const ZoomArjPlugin&) = delete;
  ZoomArjPlugin& operator=(const ZoomArjPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace zoom_arj

#endif  // FLUTTER_PLUGIN_ZOOM_ARJ_PLUGIN_H_
