import 'package:flutter/material.dart';
class Assets {
  static String _imageFolderPath = "assets/images/";
  static set imageFolderPath(String imageFolderPath) => _imageFolderPath =
      imageFolderPath.endsWith("/") ? imageFolderPath : "$imageFolderPath/";
  static String get imageFolderPath => _imageFolderPath;
  static AssetImage image(String image) {
    return AssetImage("$imageFolderPath$image");
  }
}
