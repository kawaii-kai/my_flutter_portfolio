import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

enum UrlType {
  url,
  phoneNumber,
  email,
  maps, // when passing maps, URL string must be formatted to latitude,longitude
}

class UrlServices {
  static Future<void> openUrl(
    String? urlString,
    String module,
    UrlType urlType,
  ) async {
    if (urlString == null || urlString.isEmpty) return;
    
    late Uri uri;
    switch (urlType) {
      case UrlType.phoneNumber:
        uri = Uri(scheme: 'tel', path: urlString);
        break;
      case UrlType.email:
        uri = Uri(scheme: 'mailto', path: urlString);
        break;
      case UrlType.maps:
        uri = Uri.parse(Platform.isAndroid ? 'geo:$urlString?q=$urlString' : 'maps:$urlString?q=$urlString');
        break;
      case UrlType.url:
      default:
        uri = Uri.parse(urlString);
        break;
    }

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint('Could not launch $uri');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }
}