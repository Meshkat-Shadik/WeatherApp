//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import geocoding_darwin
import geolocator_apple
import package_info_plus
import url_launcher_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  GeocodingDarwinPlugin.register(with: registry.registrar(forPlugin: "GeocodingDarwinPlugin"))
  GeolocatorPlugin.register(with: registry.registrar(forPlugin: "GeolocatorPlugin"))
  FPPPackageInfoPlusPlugin.register(with: registry.registrar(forPlugin: "FPPPackageInfoPlusPlugin"))
  UrlLauncherPlugin.register(with: registry.registrar(forPlugin: "UrlLauncherPlugin"))
}
