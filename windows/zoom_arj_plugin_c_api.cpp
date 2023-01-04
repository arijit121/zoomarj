#include "include/zoom_arj/zoom_arj_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "zoom_arj_plugin.h"

void ZoomArjPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  zoom_arj::ZoomArjPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
